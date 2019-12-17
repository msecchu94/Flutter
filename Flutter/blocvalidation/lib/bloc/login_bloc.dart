import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocvalidation/src/Providers/Registro_Provider.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Ingresar) {
      yield Validando();
      final res = await UsuarioProvider().login(event.email, event.pass);
      if (res['ok']) {
        yield Validado();
      } else {
        yield ErrorLogin('error');
      }
    } else if (event is Regresar) {
      yield InitialLoginState();
    }
  }
}
