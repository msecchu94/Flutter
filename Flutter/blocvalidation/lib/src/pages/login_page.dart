import 'package:blocvalidation/bloc/login_bloc.dart';
import 'package:blocvalidation/bloc/login_event.dart';
import 'package:blocvalidation/bloc/login_state.dart';
import 'package:blocvalidation/bloc/provider.dart';
import 'package:blocvalidation/bloc/validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Validator validator = new Validator();

  LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocListener<LoginBloc, LoginState>(
          bloc: loginBloc,
          listener: (context, state) {
            if (state is ErrorLogin) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              loginBloc.add(Regresar());
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: loginBloc,
            builder: (context, state) {
              if (state is InitialLoginState) {
                return _stackPrincipal(context);
              } else if (state is Validando) {
                return _stackLoading(context);
              }else if (state is Validado)
              {return }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _stackPrincipal(context) {
    return Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context), //
      ],
    );
  }

  Widget _stackLoading(context) {
    return Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginFormLoading(context), //
      ],
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

  Widget _loginForm(context) {
    final inputValid = Provider.of(context);
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

            //esconder column y devolver circular progres bar si el estado es Validando

            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _crearInput(inputValid),
                SizedBox(height: 10.0),
                _crearPassword(inputValid),
                SizedBox(height: 40.0),
                _crearBoton(inputValid),
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

  Widget _loginFormLoading(context) {
    final inputValid = Provider.of(context);
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

            //esconder column y devolver circular progres bar si el estado es Validando

            child: Column(
              children: <Widget>[buildLoading()],
            ),
          ),
          Text('¿Olvido contraseña?'),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _crearInput(LoginBl inputValid) {
    return StreamBuilder(
        stream: inputValid.emailStream,
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
              onChanged: (value) => inputValid.changeEmail(value),
            ),
          );
        });
  }

  Widget _crearPassword(LoginBl inputValid) {
    return StreamBuilder(
        stream: inputValid.passStream,
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
              onChanged: (value) => inputValid.changePass(value),
            ),
          );
        });
  }

  Widget _crearBoton(LoginBl inputValid) {
    return StreamBuilder(
      stream: inputValid.fromValidStream,
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
          onPressed:
              snapshot.hasData ? () => _login(inputValid, context) : null,
        );
      },
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _login(LoginBl inputValid, BuildContext context) {
    loginBloc.add(Ingresar(inputValid.email, inputValid.pass));

    print('=====================');
    print('Email : ${inputValid.email}');
    print('Pass  : ${inputValid.pass}');
    print('=====================');
    // Navigator.pushReplacementNamed(context, 'home');
  }
}
