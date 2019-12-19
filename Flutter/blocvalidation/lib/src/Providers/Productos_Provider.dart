import 'dart:convert';

import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {
  final String _url = 'https://flutter-user-e73a7.firebaseio.com';

  Future<bool> crearProducto(ProductoModel productoModel) async {
    final url = '$_url/productos.json';

    final res = await http.post(url, body: productoModelToJson(productoModel));

    final decodeData = json.decode(res.body);
    print(decodeData);
    return true;
  }
 
  Future<bool> editarProducto(ProductoModel productoModel) async {
    final url = '$_url/productos/${productoModel.id}.json';

    final res = await http.put(url, body: productoModelToJson(productoModel));

    final decodeData = json.decode(res.body);
    print(decodeData);
    return true;
  }

  Future<List<ProductoModel>> crearLista() async {
    final url = '$_url/productos.json';

    final res = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(res.body);
    final List<ProductoModel> productos = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, producto) {
      final prodTemp = ProductoModel.fromJson(producto);
      prodTemp.id = id;

      productos.add(prodTemp);
    });
    print(productos);
    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';

    final res = await http.delete(url);

    print(json.decode(res.body));
  }
}
