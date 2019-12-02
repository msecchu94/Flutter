import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreadmeapp/src/models/qr_model.dart';


class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: crearFlutterMap(scan),
      ),
    );
  }

  crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(center: scan.getLatLng(), zoom: 10),
      layers: [_crearMapa()],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}2x.png?access_token={accessToken}',
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoibWF4aXNlY2NoaSIsImEiOiJjazNvcnVnbTQwNGNsM29xdG43eTg1MmNwIn0.rdffKF54lP3-0qEACmvEaA',
              'id':'mapbox.streets'//dark , light,outdoors.satellite
            }
            );
           
  }
}
