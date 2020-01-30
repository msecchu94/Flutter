import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botones(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _botonNavegacion(context),
    );
  }

  Widget _fondo() {
    final gradiente = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.4),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 4.0,
        child: Container(
            height: 270.0,
            width: 280.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(236, 98, 188, 1.0),
                  Color.fromRGBO(241, 142, 172, 1.0)
                ]))));

    return Stack(
      children: <Widget>[gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category',
                style: TextStyle(color: Colors.white, fontSize: 13.0)),
          ],
        ),
      ),
    );
  }

  Widget _botonNavegacion(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outlined), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), title: Container()),
          ],
        ));
  }

  Widget _botones() {
    return Table(children: [
      TableRow(
        children: [
          _crearBotonesRedondeados(),
          _crearBotonesRedondeados(),
        ],
      ),
      TableRow(
        children: [
          _crearBotonesRedondeados(),
          _crearBotonesRedondeados(),
        ],
      ),
      TableRow(
        children: [
          _crearBotonesRedondeados(),
          _crearBotonesRedondeados(),
        ],
      ),
      TableRow(
        children: [
          _crearBotonesRedondeados(),
          _crearBotonesRedondeados(),
        ],
      )
    ]);
  }

  Widget _crearBotonesRedondeados() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 30.0,
                  )),
              Text('Enter', style: TextStyle(color: Colors.pinkAccent)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
