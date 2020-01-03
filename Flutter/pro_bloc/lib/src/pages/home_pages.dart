import 'package:flutter/material.dart';
import 'package:pro_bloc/src/provider/heroesinfo.dart';
import 'package:pro_bloc/src/widgets/super_floatinaction.dart';
import 'package:pro_bloc/src/widgets/super_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(heroesInfo.heroe),
      ),
      body: Center(child: SuperTextPage()),
      floatingActionButton: FloatingPage(),
    );
  }
}
