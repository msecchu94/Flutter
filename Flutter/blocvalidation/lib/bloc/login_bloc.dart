import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocvalidation/src/models/login_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final LoginAppRepository repoLogin;
  // LoginBloc(this.repoLogin);

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield Validando();
    if (event is Ingresar) {
      try {
        final model = await LoginAppRepository().validarModelo(event.email, event.pass);
        yield Validado(model);
      } on NetworkError {
        yield ErrorLogin("Usuario y/o contraseña incorrecto");
      }
    }else
    if(event is Regresar){
      yield InitialLoginState();
    }
  }
}
