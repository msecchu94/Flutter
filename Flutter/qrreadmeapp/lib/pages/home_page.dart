import 'package:flutter/material.dart';

import 'package:qrreadmeapp/pages/direcciones_page.dart';
import 'package:qrreadmeapp/pages/mapas_page.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QRapp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {},
            )
          ],
        ),
        body: navegar(currentIndex),
        bottomNavigationBar: craBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.filter_center_focus),
          onPressed: _getQR,
        ));
  }

  Widget craBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapa')),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
        ]);
  }

  Widget navegar(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }

  void _getQR() async {
    String futureString = '';

    try {
      futureString = await new QRCodeReader().scan();
    } catch (e) {
      e.toString();
    }
  }
}
