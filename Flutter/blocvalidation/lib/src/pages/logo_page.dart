import 'dart:async';

import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  LogoPage({Key key}) : super(key: key);

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 6),
      () {
        Navigator.pushNamed(context, 'login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

  final _loading =  CircularProgressIndicator();
 
    return Scaffold(
      body: Container(
        child: Column(
       children: <Widget>[
         SizedBox(height:_size.height * 0.15),
         FlutterLogo(size: _size.height * 0.7),
         _loading
       ],
          
        ),
      ),
    );
  }
}
