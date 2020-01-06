import 'package:flutter/material.dart';
import 'package:provi_dart_light/blocs/theme.dart';
import 'package:provi_dart_light/src/pages/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWidgets(),
    );
  }
}

class MaterialAppWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final theme=Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
