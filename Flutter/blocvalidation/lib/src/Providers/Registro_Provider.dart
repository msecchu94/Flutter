import 'dart:convert';

import 'package:blocvalidation/preferencias/preferencias_user.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyDPF4TLJeDevk0DpFsWjKFEjD8Xv5sVvz4 ';
  final prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> nuevoUsuario(String email, String pass) async {
    final auth = {'email': email, 'password': pass, 'returnSecureToken': true};

    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(auth));

    Map<String, dynamic> decodeRes = json.decode(res.body);
    print(decodeRes);
    if (decodeRes.containsKey('idToken')) {
      prefs.token = decodeRes['idToken'];
      return {'ok': true, 'token': decodeRes['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeRes['error']['message']};
    }
  }

  Future<Map<String, dynamic>> login(String email, String pass) async {
    final auth = {'email': email, 'password': pass, 'returnSecureToken': true};

    final res = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(auth));

    Map<String, dynamic> decodeRes = json.decode(res.body);
    print(decodeRes);

    if (decodeRes.containsKey('idToken')) {
      prefs.token = decodeRes['idToken'];
      return {'ok': true, 'token': decodeRes['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeRes['error']['message']};
    }
  }
}

class NetworkError extends Error {}
