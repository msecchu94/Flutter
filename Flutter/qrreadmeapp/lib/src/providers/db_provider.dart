import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrreadmeapp/src/models/qr_model.dart';
export 'package:qrreadmeapp/src/models/qr_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get dataBase async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScanDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Scans('
            'id INTEGER PRIMARY KEY,'
            'tipo TEXT,'
            'valor TEXT'
            ')');
      },
    );
  }

  Future nuevoScanRow(ScanModel nuevoScan) async {
    final db = await dataBase;

    final res = await db.rawInsert("INSERT into Scans (id,tipo,valor) "
        "VALUES (${nuevoScan.id},'${nuevoScan.tipo}','${nuevoScan.valor}')");
    return res;
  }

  Future nuevoScan(ScanModel nuevoScan) async {
    final db = await dataBase;

    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel> getScanId(int id) async {
    final db = await dataBase;
    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosScan() async {
    final db = await dataBase;
    final res = await db.query('Scans');

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<ScanModel>> getScanTipo(String tipo) async {
    final db = await dataBase;
    final res = await db.rawQuery("SELECT from Scans WHERE tipo='$tipo'");

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];

    return list;
  }

  Future<int> updateScan(ScanModel scanModel) async {
    final db = await dataBase;

    final res = await db.update('Scans', scanModel.toJson(),
        where: 'id=?', whereArgs: [scanModel.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await dataBase;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await dataBase;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }
}
