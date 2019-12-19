import 'package:blocvalidation/src/Providers/Productos_Provider.dart';
import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productoProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    // final bloc = new Streams();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: crearLista(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'productos'),
    );
  }

  Widget crearLista() {
    return FutureBuilder(
        future: productoProvider.crearLista(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductoModel>> snapshot) {
          final productos = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, i) => crearItem(productos[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget crearItem(ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direccion) {
        productoProvider.borrarProducto(producto.id);
      },
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: () {
          Navigator.pushNamed(context, 'productos',arguments: producto);
        },
      ),
    );
  }
}
