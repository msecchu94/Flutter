import 'package:blocvalidation/src/Streams/Login_Validator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = new LoginBl();

    
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text('Home')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email : ${bloc.email}'),
          Divider(),
          Text('Email : ${bloc.pass}'),
        ],
      ),
    );
  }
}
