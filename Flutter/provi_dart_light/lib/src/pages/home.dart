import 'package:flutter/material.dart';
import 'package:provi_dart_light/blocs/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListadoBotones(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => theme.setTheme(ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lime,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.lime))),
      ),
    );
  }
}

class ListadoBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Dark'),
          onPressed: () => theme.setTheme(ThemeData.dark()),
        ),
        FlatButton(
          child: Text('Light'),
          onPressed: () => theme.setTheme(ThemeData.light()),
        )
      ],
    );
  }
}
