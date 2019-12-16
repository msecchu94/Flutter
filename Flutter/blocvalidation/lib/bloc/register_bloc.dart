import 'package:blocvalidation/bloc/register_event.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocvalidation/bloc/register_state.dart';
import 'package:blocvalidation/src/Providers/Registro_Provider.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is Registrar) {
      yield Registrando();
      try {
        final user = await UsuarioProvider().nuevoUsuario(event.email, event.pass);
        yield 
        
       }
       // on (e) {
      // }
      
    }
  }
}
