import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:device_preview/device_preview.dart';

import 'view/Principal.dart';
import 'view/cadastro_usuario.dart';
import 'view/conteudo_lista.dart';
import 'view/lista_nome.dart';
import 'view/sobre.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

//
// MainApp
//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipalView(),

      initialRoute: 't1',
      routes: {
        'principal' :(context) => Principal(),
        'cadastro_usuario' :(context) => CadastroUsuarioView(),
        'sobre' :(context) => Sobre(),
        'lista_nome' :(context) => ListaNome(),
        'conteudo_lista' :(context) => ConteudoLista(),
      },
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  var formKey = GlobalKey<FormState>();
  var status = false;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Form(
            key: formKey,
            child: Column(
              children: [

                Image.asset('lib/images/2921829.png'),
                SizedBox(height: 10),

                TextFormField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),

                  validator: (value){
                    if(value!.isEmpty){
                      return 'Informe um Email';
                    }

                    else if(EmailValidator.validate(value) == false){
                      return 'Informe um Email válido';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: txtSenha,

                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),

                  validator: (value){
                    if (value!.isEmpty){
                      return 'Informe a senha';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 30),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      Navigator.pushNamed(context, 'principal');

                    }

                    else{
                      
                    }
                  },

                  child: Text('Entrar', ),
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
