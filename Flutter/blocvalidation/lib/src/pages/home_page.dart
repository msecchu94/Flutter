// import 'package:blocvalidation/bloc/producto_bloc.dart';
// import 'package:blocvalidation/bloc/producto_state.dart';
import 'package:flutter/material.dart';
import 'package:blocvalidation/src/Providers/Productos_Provider.dart';
import 'package:blocvalidation/src/models/productos_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productoProvider = new ProductosProvider();
  // ProductoBloc blocProducto;

  @override
  void initState() {
    super.initState();
    // blocProducto = new ProductoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: Container(
        child: _crearLista(),
      ),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'productos'),
    );
  }

  Widget _crearLista() {
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
        child: Card(
          child: Column(
            children: <Widget>[
              (producto.fotoUrl == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(producto.fotoUrl),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text('${producto.titulo} - ${producto.valor}'),
                subtitle: Text(producto.id),
                onTap: () {
                  Navigator.pushNamed(context, 'productos',
                      arguments: producto);
                },
              ),
            ],
          ),
        ));
  }
}
