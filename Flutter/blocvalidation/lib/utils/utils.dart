import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }
  final n = num.tryParse(s);
  return (n != null) ? true : false;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informacion Incorrecta'),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
