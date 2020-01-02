import 'package:flutter/material.dart';

final _estiloTexto = TextStyle(fontSize: 20.0, color: Colors.white);
final liquidPages = [
  Container(
      color: Colors.pinkAccent,
      child: Center(
          child: Text(
        'Slide 1',
        style: _estiloTexto,
      ))),
  Container(
      color: Colors.purpleAccent,
      child: Center(
          child: Text(
        'Slide 2',
        style: _estiloTexto,
      ))),
  Container(
      color: Colors.blueAccent,
      child: Center(
          child: Text(
        'Slide 3',
        style: _estiloTexto,
      ))),
  Container(
      color: Colors.blueGrey,
      child: Center(
          child: Text(
        'Slide 4',
        style: _estiloTexto,
      ))),
  Container(
      color: Colors.deepOrangeAccent,
      child: Center(
          child: Text(
        'Slide 5',
        style: _estiloTexto,
      )))
];
