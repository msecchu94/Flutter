import 'package:flutter/material.dart';
import 'package:pro_bloc/src/provider/heroesinfo.dart';
import 'package:pro_bloc/src/provider/villanosinfo.dart';
import 'package:provider/provider.dart';

class FloatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroesInfo>(context);
    final villanosibfo = Provider.of<VillanosInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.access_alarm),
          backgroundColor: Colors.red,
          onPressed: () {
            heroesInfo.heroe = 'IROMAN';
            villanosibfo.villano = 'narnia';
          },
        ),
        SizedBox(height: 10.0),
        FloatingActionButton(
            child: Icon(Icons.adb),
            backgroundColor: Colors.green,
            onPressed: () {
              heroesInfo.heroe = 'ACUAMAN';
              villanosibfo.villano = 'eiaa';
            })
      ],
    );
  }
}
