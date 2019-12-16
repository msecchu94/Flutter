import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';


abstract class RegisterEvent extends Equatable {
  
const RegisterEvent();

}

class Registrar extends RegisterEvent{

  final String email;
  final String pass;

 const Registrar(this.email, this.pass);
 
 @override
 List<Object> get props => [email,pass];

}