import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetLogin extends LoginEvent {
  final String email;
  final String pass;

  const GetLogin(this.email, this.pass);

  @override
  // TODO: implement props
  List<Object> get props => [email, pass];
}
