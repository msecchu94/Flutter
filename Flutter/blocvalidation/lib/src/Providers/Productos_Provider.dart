import 'dart:convert';
import 'dart:io';

import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:http_parser/http_parser.dart';

import 'package:mime_type/mime_type.dart';
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

  Future<String> gusrdarImagen(File imagen) async {
    final url = Uri.parse(
        'http://api.cloudinary.com/v1_1/dgg8fmlad/image/upload?upload_preset=wlisvrm6');

    final mineType = mime(imagen.path).split('/');
    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mineType[0], mineType[1]));

    imageUploadRequest.files.add(file); // adjuntar

    final streamResponse = await imageUploadRequest.send(); // ejecutar peticion

    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal ');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
}
