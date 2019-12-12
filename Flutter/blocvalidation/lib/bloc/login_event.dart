import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Ingresar extends LoginEvent {

  final String email;
  final String pass;

  const Ingresar(this.email, this.pass);

  @override
  List<Object> get props => [email, pass];
  
}
class Regresar extends LoginEvent {

  @override
  List<Object> get props => [];

}



