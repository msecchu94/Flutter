import 'package:flutter/material.dart';
import 'package:qrreadmeapp/src/providers/db_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getTodosScan(),
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
              onDismissed: (direction)=>DBProvider.db.deleteScan(scan[index].id),
              child: ListTile(
                leading: Icon(Icons.battery_charging_full),
                title: Text(scan[index].valor),
                trailing: Icon(Icons.arrow_right),
              ),
            );
          },
        );
      },
    );
  }
}
