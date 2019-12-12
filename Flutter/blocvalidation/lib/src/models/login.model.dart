import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginModel extends Equatable {

  final String email;
  final String password;

  LoginModel({@required this.email,
   @required this.password});

  @override
  List<Object> get props => [password,email];
  
}
