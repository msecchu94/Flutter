import 'package:flutter/material.dart';
import 'package:pro_bloc/src/pages/home_pages.dart';
import 'package:pro_bloc/src/provider/heroesinfo.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => HeroesInfo(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {'home': (context) => HomePage()}),
    );
  }
}
