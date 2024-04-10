import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CadastroUsuarioView extends StatefulWidget {
  const CadastroUsuarioView({super.key});

  @override
  State<CadastroUsuarioView> createState() => _CadastroUsuarioViewState();
}

class _CadastroUsuarioViewState extends State<CadastroUsuarioView> {

  var formKey = GlobalKey<FormState>();
  var status = false;
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtNome = TextEditingController();
  var txtTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Form(
            key: formKey,
            child: Column(
              children: [
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

                TextFormField(
                  controller: txtNome,

                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),

                  validator: (value){
                    if (value!.isEmpty){
                      return 'Informe um nome';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),

                TextFormField(
                  controller: txtTelefone,

                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    border: OutlineInputBorder(),
                  ),

                  validator: (value){
                    if (value!.isEmpty){
                      return 'Informe um número de telefone';
                    }
                    else if(value.length != 11){
                      return 'Informe um número de telefone válido';

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

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuário cadastrado com sucesso !')),
                      );
                      

                    }

                    else{
                      
                    }
                  },

                  child: Text('Cadastrar'),
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}