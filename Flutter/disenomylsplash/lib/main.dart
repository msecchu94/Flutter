import 'package:avatar_glow/avatar_glow.dart';
import 'package:disenomylsplash/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    // final size= MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Column(
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 90,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 2),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(side: BorderSide(width: 0.2)),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Image.asset(
                            'assets/logoSimbolo.png',
                            fit: BoxFit.cover,
                          ),

                          // FlutterLogo(
                          //   size: 50.0,
                          // ),
                          radius: 60.0,
                        )),
                  ),
                  DelayedAnimation(
                    child: Image.asset(
                      'assets/logoTexto1.png',
                      fit: BoxFit.cover,
                    ),
                    delay: delayedAmount + 1000,
                  ),
                  DelayedAnimation(
                    child: Image.asset(
                      'assets/logoTexto2.png',
                      fit: BoxFit.cover,
                    ),
                    delay: delayedAmount + 2000,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  DelayedAnimation(
                    child: Text(
                      "Sistema de Gestion",
                      style: TextStyle(fontSize: 20.0, color: color),
                    ),
                    delay: delayedAmount + 3000,
                  ),
                  DelayedAnimation(
                    child: Text(
                      "de Pedidos",
                      style: TextStyle(fontSize: 20.0, color: color),
                    ),
                    delay: delayedAmount + 3000,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  DelayedAnimation(
                    child: GestureDetector(
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _animatedButtonUI,
                      ),
                    ),
                    delay: delayedAmount + 4000,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  DelayedAnimation(
                    child: Text(
                      "".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                    delay: delayedAmount + 5000,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Bienvenido !',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.red
              // (0xFF8185E2)
              ,
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
