import 'package:equatable/equatable.dart';

abstract class ProductoState extends Equatable {
  const ProductoState();
}

class InitialProductoState extends ProductoState {
  @override
  List<Object> get props => [];
}
