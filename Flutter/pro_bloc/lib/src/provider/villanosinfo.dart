import 'package:flutter/material.dart';

class VillanosInfo with ChangeNotifier {
  String _villano = 'narnia';

  get villano {
    return _villano;
  }

  set villano(String nombre) {
    this._villano = nombre;
    notifyListeners();
  }
}
