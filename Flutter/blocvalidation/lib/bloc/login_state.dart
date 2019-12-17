import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  
  @override
  List<Object> get props => [];
}

class Validando extends LoginState {
  Validando();
  @override
  List<Object> get props => [];
}
class Validado extends LoginState {
 
  Validado();
  @override
  List<Object> get props => [];
}

class ErrorLogin extends LoginState {
  final String message;

  const ErrorLogin(this.message);
  @override
  List<Object> get props => [message];
}
