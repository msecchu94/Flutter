import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:formvalidation/bloc/validators.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final claseValidadora = new Validator();

  @override
  LoginState get initialState => InicialLogin();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // yield InicialLogin();
    // if (event is Validar) {
    //   try {
    //     final logear = await claseValidadora.validarPassword(event.email);
    //   } on NetworkError {
    //     yield ErrorLogin("error");
    //   }
    // } else {}
  }
}
