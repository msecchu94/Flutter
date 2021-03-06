import 'package:flutter/material.dart';

class FondoCircular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          right: -(size.width) * 0.3,
          top: -(size.width) * 0.3,
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1.00),
              borderRadius: BorderRadius.circular(3000.0),
            ),
          ),
        )
      ],
    );
  }
}
