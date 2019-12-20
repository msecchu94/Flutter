import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocvalidation/bloc/producto_event.dart';
import 'package:blocvalidation/bloc/producto_state.dart';
import './bloc.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {
  @override
  ProductoState get initialState => InitialProductoState();

  @override
  Stream<ProductoState> mapEventToState(
    ProductoEvent event,
  ) async* {
  
  }
}
