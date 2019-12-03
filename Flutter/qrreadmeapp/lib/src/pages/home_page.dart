import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qrreadmeapp/src/bloc/scans_bloc.dart';
import 'package:qrreadmeapp/src/models/qr_model.dart';

import 'direcciones_page.dart';
// import 'package:qrcode_reader/qrcode_reader.dart';
import 'mapas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QRapp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                scansBloc.borarTodosScans();
              },
            )
          ],
        ),
        body: navegar(currentIndex),
        bottomNavigationBar: craBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.filter_center_focus),
          onPressed: () => _getQR(context),
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

  // htps://google.com
  // geo:40.724233047051785,-74.0731459101564

  _getQR(BuildContext context) async {
    String futureString = 'https://google.com';

    // try {
    //   futureString = await new QRCodeReader().scan();
    // } catch (e) {
    //   e.toString();
    // }

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      final scan2 =
          ScanModel(valor: 'geo:40.724233047051785,-74.0731459101564');
      scansBloc.agregarScan(scan2);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750));
        // utils.abrirScan(context, scan);
      } else {
        // utils.abrirScan(context, scan);
      }
    }
  }
}
