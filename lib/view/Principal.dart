import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}



class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'cadastro_usuario');
              },
              child: Text('Cadastrar Usuário'),
            ),

            SizedBox(height: 20),

            OutlinedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'sobre');

              },
              child: Text('Sobre'),
            ),

            SizedBox(height: 20),


            OutlinedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'lista_nome');

              },
              child: Text('Listas'),
              
            )
          ],
        ),
      ),
    );
  }
}