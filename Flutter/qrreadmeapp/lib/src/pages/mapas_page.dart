

import 'package:flutter/material.dart';
import 'package:qrreadmeapp/src/bloc/scans_bloc.dart';
import 'package:qrreadmeapp/src/models/qr_model.dart';
import 'package:qrreadmeapp/src/utils/scans_utils.dart' as utils;

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scansBloc = new ScansBloc();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scan = snapshot.data;

        if (scan.length == 0) {
          return Center(
            child: Text('No se encontraron datos'),
          );
        }

        return ListView.builder(
          itemCount: scan.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.orangeAccent),
              onDismissed: (direction) => scansBloc.borrarScan(scan[index].id),
              child: ListTile(
                leading: Icon(Icons.battery_charging_full),
                title: Text(scan[index].valor),
                subtitle: Text(scan[index].id.toString()),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  utils.abrirScan(context, scan[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
