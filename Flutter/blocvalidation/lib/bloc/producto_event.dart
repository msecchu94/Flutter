import 'dart:io';

import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductoEvent extends Equatable {
  const ProductoEvent();
}

class GuardarEvent extends ProductoEvent {
  final File foto;
  ProductoModel productoModel;
  GuardarEvent(this.foto, this.productoModel);

  @override
  List<Object> get props => [foto,productoModel];
}
