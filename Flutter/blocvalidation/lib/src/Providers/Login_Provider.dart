import 'package:blocvalidation/bloc/bloc.dart';
import 'package:blocvalidation/src/Streams/Login_Validator.dart';
export 'package:blocvalidation/src/Streams/Login_Validator.dart';

import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final loginBloc = new Streams();
  // final validador = new Validator();
  // final blocLogin = new LoginBloc();
  // final blocRegister = new RegisterBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Streams of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }

  // static Validator of(BuildContext context){
  //   return (context.inheritFromWidgetOfExactType(Provider) as Provider).validador;
  // }
}
