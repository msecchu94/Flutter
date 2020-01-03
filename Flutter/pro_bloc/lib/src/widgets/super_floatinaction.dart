import 'package:flutter/material.dart';

class FloatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.access_alarm),
          backgroundColor: Colors.red,
          onPressed: () {},
        ),
        SizedBox(height: 10.0),
        FloatingActionButton(
          child: Icon(Icons.adb),
          backgroundColor: Colors.green,
          onPressed: () {},
        )
      ],
    );
  }
}
