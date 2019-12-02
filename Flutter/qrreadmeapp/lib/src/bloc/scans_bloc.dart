import 'dart:async';

import 'package:qrreadmeapp/src/models/qr_model.dart';
import 'package:qrreadmeapp/src/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal(){
    obtenerScans();
  }

  final _scansController = new StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose() {
    _scansController.close();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.getTodosScan());
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borarTodosScans() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}
