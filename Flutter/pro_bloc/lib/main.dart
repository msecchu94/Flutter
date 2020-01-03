import 'package:flutter/material.dart';
import 'package:pro_bloc/src/pages/home_pages.dart';
import 'package:pro_bloc/src/provider/heroesinfo.dart';
import 'package:pro_bloc/src/provider/villanosinfo.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     // create: (context) => HeroesInfo(),
  //     builder: (context) => HeroesInfo(),
  //     child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         title: 'Material App',
  //         initialRoute: 'home',
  //         routes: {'home': (context) => HomePage()}),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => HeroesInfo(),
        ),
        ChangeNotifierProvider(
          builder: (context) => VillanosInfo(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {'home': (context) => HomePage()}),
    );
  }
}
