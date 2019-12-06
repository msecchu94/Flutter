import 'dart:async';

import 'package:formvalidation/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBl with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passStream =>
      _passwordController.stream.transform(validarPassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  Stream<bool> get fromValidStream =>
      Observable.combineLatest2(emailStream, passStream, (e, p) => true);

  String get email => _emailController.value;
  String get pass => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
