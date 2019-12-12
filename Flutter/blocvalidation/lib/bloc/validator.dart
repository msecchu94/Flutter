import 'dart:async';


import 'package:rxdart/rxdart.dart';

class Validator {

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Mas de 6 caracteres');
    }
  });
  
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('error de formato');
    }
  });
}

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