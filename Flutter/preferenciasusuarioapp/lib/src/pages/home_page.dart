import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_prefs/preferencias_usuario.dart';

import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuarios();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario:${prefs.colorSecundario}'),
          Divider(),
          Text('Genero:${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario : ${prefs.nombreUsuraio}'),
          Divider(),
        ],
      ),
    );
  }
}
