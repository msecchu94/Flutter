// import 'package:blocvalidation/src/models/productos_model.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';

abstract class ProductoState extends Equatable {
  const ProductoState();
}

class InitialProductoState extends ProductoState {
  InitialProductoState();
  @override
  List<Object> get props => [];
}

class GuardandoState extends ProductoState {
  @override
  List<Object> get props => null;
}

class GuardadoState extends ProductoState {
  @override
  List<Object> get props => null;
}
