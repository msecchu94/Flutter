import 'package:equatable/equatable.dart';
import 'package:formvalidation/data/model/login.model.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InicialLogin extends LoginState {
  InicialLogin();
  @override
  List<Object> get props => [];
}

class CargandoHome extends LoginState {
  CargandoHome();
  @override
  List<Object> get props => [];
}

class Home extends LoginState {
  final LoginModel loginModel;

  Home(this.loginModel);
  @override
  List<Object> get props => [loginModel];
}
