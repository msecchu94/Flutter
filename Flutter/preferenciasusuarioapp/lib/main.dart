import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasusuarioapp/src/shared_prefs/preferencias_usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());

  final prefs = new PreferenciasUsuarios();
  await prefs.initPrefs();
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuarios();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
