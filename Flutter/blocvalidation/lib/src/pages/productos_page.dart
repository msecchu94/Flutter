import 'dart:io';

import 'package:blocvalidation/src/Providers/Productos_Provider.dart';
import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:blocvalidation/utils/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scafoldKey = GlobalKey<ScaffoldState>();
  ProductoModel producto = new ProductoModel();
  final productosProvider = new ProductosProvider();
  bool _guardado = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final ProductoModel proData = ModalRoute.of(context).settings.arguments;
    if (proData != null) {
      producto = proData;
    }

    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text('Productos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _mostrarFoto(),
                  _crearProductoNombre(),
                  _crearProductoPrecio(),
                  _crearBoton(),
                  _crearDisponible()
                ],
              )),
        ),
      ),
    );
  }

  _crearProductoNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      decoration: InputDecoration(labelText: 'Productos'),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del Producto';
        } else {
          return null;
        }
      },
    );
  }

  _crearProductoPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      initialValue: producto.valor.toString(),
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Solo Numeros';
        }
      },
    );
  }

  _crearBoton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        label: Text('Guardar'),
        icon: Icon(Icons.save),
        onPressed: (_guardado) ? null : _submit);
  }

  _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }

  void mostrarSnack(String mensaje) {
    final snack = SnackBar(
        content: Text(mensaje), duration: Duration(milliseconds: 1500));
    scafoldKey.currentState.showSnackBar(snack);
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _guardado = true;
      if (producto.id == null) {
        productosProvider.crearProducto(producto);
      } else {
        productosProvider.editarProducto(producto);
      }
    }
    // mostrarSnack('Registro guardado');
    Navigator.pop(context);
  }

  Widget _mostrarFoto() {
    if (producto.fotoUrl != null) {
      return Container();
    } else {
      return Image(
        image: AssetImage(foto?.path ?? 'assets/no-image.png'),
        height: 200.0,
        fit: BoxFit.cover,
      );
    }
  }

  _seleccionarFoto() async {
    _procesarImage(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImage(ImageSource.camera);
  }

  _procesarImage(ImageSource origen) async {
    foto = await ImagePicker.pickImage(source: origen);
    if (foto != null) {}
    setState(() {});
  }
}
