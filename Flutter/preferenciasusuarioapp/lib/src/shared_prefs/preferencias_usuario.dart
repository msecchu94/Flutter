import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuarios {
  static final PreferenciasUsuarios _instancia =
      new PreferenciasUsuarios._internal();

  PreferenciasUsuarios._internal();

  factory PreferenciasUsuarios() {
    return _instancia;
  }

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  bool _colorSecundario;
  int _genero;
  String _nombre;

  //get set genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //get set colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // get set genero
  get nombreUsuraio {
    return _prefs.getString('nombre') ?? '';
  }

  set nombreUsuraio(String value) {
    _prefs.setString('nombre', value);
  }
}
