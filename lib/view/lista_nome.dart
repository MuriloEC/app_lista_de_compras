import 'package:flutter/material.dart';

class ListaNome extends StatefulWidget {
  const ListaNome({Key? key}) : super(key: key);

  @override
  State<ListaNome> createState() => _ListaNomeState();
}

class Lista {
  String nome;

  Lista(this.nome);

  static List<Lista> gerarLista(String nome){
    List<Lista> lista = [];

    lista.add(Lista(nome));

    return lista;
  }
}

class _ListaNomeState extends State<ListaNome> {
  List<Lista> lista = [];
  TextEditingController nomeLista = TextEditingController();

  @override
  void initState() {
    super.initState();
    lista = Lista.gerarLista("Exemplo"); // Inicializando com um exemplo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suas Listas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nomeLista,
                    decoration: InputDecoration(
                      hintText: 'Digite um nome',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String Nome = nomeLista.text.trim();
                    if (Nome.isNotEmpty) {
                      setState(() {
                        lista.add(Lista(Nome));
                        nomeLista.clear();
                      });
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(lista[index].nome),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          EditarNome(index);
                        },
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'conteudo_lista');
                      },

                      onLongPress: () {
                        setState(() {
                          lista.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void EditarNome(int index) {
    TextEditingController novoNomeLista = TextEditingController(text: lista[index].nome);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar nome da lista'),
          content: TextField(
            controller: novoNomeLista,
            decoration: InputDecoration(hintText: 'Novo nome'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Atualiza o nome da lista com o novo valor
                  lista[index].nome = novoNomeLista.text.trim();
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nomeLista.dispose();
    super.dispose();
  }
}
