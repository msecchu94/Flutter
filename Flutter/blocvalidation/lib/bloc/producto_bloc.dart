import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocvalidation/bloc/producto_event.dart';
import 'package:blocvalidation/bloc/producto_state.dart';
import 'package:blocvalidation/src/Providers/Productos_Provider.dart';
import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {
  ProductoModel producto;
  final formKey = GlobalKey<FormState>();
  final productosProvider = new ProductosProvider();
  @override
  ProductoState get initialState => InitialProductoState();

  @override
  Stream<ProductoState> mapEventToState(
    ProductoEvent event,
  ) async* {
    if (event is GuardarEvent) {
      yield GuardandoState();

      if (event.foto != null) {
        producto.fotoUrl = await productosProvider.gusrdarImagen(event.foto);
      } else if (event.productoModel.id == null) {
        productosProvider.crearProducto(event.productoModel);
        yield GuardadoState();
      } else {
        productosProvider.editarProducto(event.productoModel);
        yield GuardadoState();
      }
    }
  }
}
