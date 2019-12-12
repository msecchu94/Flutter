import 'package:blocvalidation/bloc/validator.dart';

import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final loginBloc = new LoginBl();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  // : super(key: key, child: child)

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBl of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)
        .loginBloc;
  }
}
