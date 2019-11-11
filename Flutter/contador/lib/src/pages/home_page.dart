import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
final textoEstilo = new TextStyle(fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('Numeros de Clicks',style: textoEstilo),
            Text('0',style: textoEstilo),
        ],
      )),
    );
  }
}
