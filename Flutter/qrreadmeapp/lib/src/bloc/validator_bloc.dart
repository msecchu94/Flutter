import 'dart:async';

import 'package:qrreadmeapp/src/models/qr_model.dart';

class Validator {

  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scan, sink) {
    final geoScan = scan.where((s) => s.tipo == 'geo').toList();
    sink.add(geoScan);
  });


  final validarHttp=
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scan, sink) {
    final geoScan = scan.where((s) => s.tipo == 'http').toList();
    sink.add(geoScan);
  });
}
