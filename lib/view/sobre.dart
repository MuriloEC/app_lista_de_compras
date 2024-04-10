// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre o desenvolvedor'),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [

            Text('Nome: \nMurilo Esperancini Casagrande\n', style: TextStyle(fontSize: 20)),
            Text('Código: \n836683\n', style: TextStyle(fontSize: 20)),
            Text('Tema: \nMercado/Compras\n', style: TextStyle(fontSize: 20),),
            Text('Objetivo: \nDesenvolver um app para gerenciar listas de compras\n', style: TextStyle(fontSize: 20)),
          ],
          ),
        ),
      ),
    );
  }
}