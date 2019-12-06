import 'package:flutter/material.dart';
import 'package:formvalidation/bloc/login.dart';
import 'package:formvalidation/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 145.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 15.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 2.0),
                      spreadRadius: 1.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _crearInput(bloc),
                SizedBox(height: 10.0),
                _crearPassword(bloc),
                SizedBox(height: 40.0),
                _crearBoton(bloc),
                // _crearBoton(),
              ],
            ),
          ),
          Text('¿Olvido contraseña?'),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearFondo(context) {
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circulo = Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 50.0, left: 20.0, child: circulo),
        Positioned(top: -20.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 50.0, right: 20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 70.0),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text('Maxi Secchi',
                  style: TextStyle(color: Colors.white, fontSize: 20.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _crearInput(LoginBl bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'ejemplocorreo@.com',
                  labelText: 'Email',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _crearPassword(LoginBl bloc) {
    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                labelText: 'Password',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) => bloc.changePass(value),
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBl bloc) {
    return StreamBuilder(
      stream: bloc.fromValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Container(
            child: Text('Ingresar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(bloc,context) : null,
        );
      },
    );
  }

  _login(LoginBl bloc, BuildContext context) {
    print('=====================');
    print('Email : ${bloc.email}');
    print('Pass  : ${bloc.pass}');
    print('=====================');
    Navigator.pushReplacementNamed(context, 'home');
  }
}
