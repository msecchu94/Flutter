import 'package:flutter/material.dart';
import 'package:pro_bloc/src/provider/heroesinfo.dart';
import 'package:pro_bloc/src/provider/villanosinfo.dart';
import 'package:provider/provider.dart';

class SuperTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);
    final villanosinfo = Provider.of<VillanosInfo>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(heroesInfo.heroe), Text(villanosinfo.villano)]);
  }
}
