import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State {
  final _textoEstilo = new TextStyle(fontSize: 23);
  int _conteo = 10;

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
            Text('Numeros de Clicks', style: _textoEstilo),
            Text('$_conteo', style: _textoEstilo),
          ],
        )),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(children: <Widget>[
      SizedBox(width:30.0 ),
      FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _reset),
      Expanded(child: SizedBox(width:5.0 )),
      FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer),
      SizedBox(width:5.0 ),
      FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar)
    ]);
  }

  void _agregar(){

    setState(() => _conteo++);
  }

  void _sustraer(){

    setState(() => _conteo--);
  }

  void _reset(){
    setState(() => _conteo=0);
  }
}
