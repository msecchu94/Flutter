import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Validar extends LoginEvent {
  final String email;
  final String pass;

  const Validar(this.email, this.pass);

  @override
  List<Object> get props => [email, pass];
}

class Ingresar extends LoginEvent {
  final String email;
  final String pass;

  const Ingresar(this.email, this.pass);

  @override
  List<Object> get props => [email, pass];
}
