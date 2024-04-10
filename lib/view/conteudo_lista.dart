import 'package:flutter/material.dart';

class ConteudoLista extends StatefulWidget {
  const ConteudoLista({super.key});

  @override
  State<ConteudoLista> createState() => _ConteudoListaState();
}

class ItemLista {
  String nome;
  bool marcado; 

  ItemLista(this.nome, {this.marcado = false});

  static List<ItemLista> gerarLista(String nome) {
    List<ItemLista> lista = [];
    lista.add(ItemLista(nome));
    return lista;
  }
}

class _ConteudoListaState extends State<ConteudoLista> {
  List<ItemLista> lista = [];
  TextEditingController nomeItem = TextEditingController();

  @override
  void initState() {
    super.initState();
    lista = ItemLista.gerarLista("Exemplo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens da lista'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nomeItem,
                    decoration: InputDecoration(
                      hintText: 'Digite um item e quantidade',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String novoNome = nomeItem.text.trim();
                    if (novoNome.isNotEmpty) {
                      setState(() {
                        lista.add(ItemLista(novoNome));
                        nomeItem.clear();
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
                      leading: IconButton(
                        icon: Icon(
                          lista[index].marcado ? Icons.check_box : Icons.check_box_outline_blank,
                        ),
                        onPressed: () {
                          setState(() {
                            lista[index].marcado = !lista[index].marcado;
                          });
                        },
                      ),
                      title: Text(lista[index].nome),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          EditarNome(index);
                        },
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(lista[index].nome)),
                        );
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
    TextEditingController novoNomeItem =
        TextEditingController(text: lista[index].nome);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Nome'),
          content: TextField(
            controller: novoNomeItem,
            decoration: InputDecoration(hintText: 'Novo nome'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  lista[index].nome = novoNomeItem.text.trim();
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
    nomeItem.dispose();
    super.dispose();
  }
}
