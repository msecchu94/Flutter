
import 'package:blocvalidation/src/models/login.model.dart';



abstract class LoginRepository {
  Future<LoginModel> validarModelo(String email, String pass);
  // Future<LoginModel> fetchDetailedWeather(String cityName);
}


class LoginAppRepository implements LoginRepository {
  final String machEmail = 'msecchu94@gmail.com';
  final String machPass = 'maxi2019';
  @override
  Future<LoginModel> validarModelo(String email, String pass) {
    return Future.delayed(Duration(seconds: 1), () {
      if (email != machEmail || pass != machPass) {
        throw NetworkError();
      }
      return LoginModel(email: machEmail, password: machPass);
    });
  }
}

class NetworkError extends Error {}
