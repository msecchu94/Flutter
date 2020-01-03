import 'package:flutter/material.dart';
import 'package:pro_bloc/src/widgets/super_floatinaction.dart';
import 'package:pro_bloc/src/widgets/super_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body:Center(child: SuperTextPage()),
      floatingActionButton: FloatingPage(),
    );
  }
}
