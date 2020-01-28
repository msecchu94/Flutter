import 'package:extended_navbar_scaffold/extended_navbar_scaffold.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (context) => ExtendedNavigationBarScaffold(),
      },
    );
  }
}
