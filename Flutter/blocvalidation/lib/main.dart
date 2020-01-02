import 'package:blocvalidation/preferencias/preferencias_user.dart';
import 'package:blocvalidation/src/Providers/Login_Provider.dart';
import 'package:blocvalidation/src/pages/home_page.dart';
import 'package:blocvalidation/src/pages/login_page.dart';
import 'package:blocvalidation/src/pages/logo_page.dart';
import 'package:blocvalidation/src/pages/productos_page.dart';
import 'package:blocvalidation/src/pages/registro_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'logo': (BuildContext context) => LogoPage(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegistroPage(),
          'productos': (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
