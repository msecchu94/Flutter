import 'package:blocvalidation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class Registrando extends RegisterState {
  @override
  List<Object> get props => null;
}

class Registrado extends RegisterState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ErrorRegister extends RegisterState {
  final String message;

  const ErrorRegister(this.message);
  @override
  List<Object> get props => [message];
}

class ExitoRegister extends RegisterState {
  final String message;

  const ExitoRegister(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
