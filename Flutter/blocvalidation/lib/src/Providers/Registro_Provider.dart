import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {
final String _firebaseToken = 'AIzaSyDPF4TLJeDevk0DpFsWjKFEjD8Xv5sVvz4 ';

  Future nuevoUsuario(String email, String pass) async{
    final auth = {'email': email, 'password': pass, 'returnSecureToken': true};

    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(auth));

        Map<String,dynamic> decodeRes = json.decode(res.body);
         print(decodeRes);
  }
}
  