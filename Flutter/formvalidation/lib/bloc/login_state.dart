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

class HomeLoading extends LoginState {
  HomeLoading();
  @override
  List<Object> get props => [];
}

class HomeLoaded extends LoginState {
  final LoginModel loginModel;

  HomeLoaded(this.loginModel);
  @override
  List<Object> get props => [loginModel];
}

class ErrorLogin extends LoginState {
  final String message;

  const ErrorLogin(this.message);
  @override
  List<Object> get props => [message];
}
