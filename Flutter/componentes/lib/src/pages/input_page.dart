import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


String _nombre='';
String _email='';
String _fecha='';

TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title:Text('Inputs de Texto')
        ),
        body : ListView(
          padding:EdgeInsets.symetric(horizontal:10.0,vertical:20.0),
            children:<Widget>[

            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword()
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearPersona()

        ]
       )
    );


  Windget _crearInput() {
    return TextFiled(
    autofocus:true,
    textCapitalization:TextCapitalization.sentences,
    decoration:InputDecoration(
    border:OutlineInputBorder(borderRadius:BorderRadius.circular(20.0))
    counter:Text('Letra ${_nombre.length}'),
    hintText:'Nombre de la persona',3
    labelText:'Nombre',
    helperText:'solo es el nombre',
    suffixIcon:Icon(Icons.accessibility),
    icon: Icon(Icons.account_circle)
    ),
    onChange:(valor){
    
      setState((){ _nombre=valor;});
      },
      );
  },flutter_localizations:
    sdk: flutter

  Widget _crearEmail(){

    return TextFiled(
    keyboardType:TextInputType.emailAddress,
    decoration:InputDecoration(
    border:OutlineInputBorder(borderRadius:BorderRadius.circular(20.0))
    hintText:'Email',
    labelText:'Email',
    suffixIcon:Icon(Icons.alternate_email),
    icon: Icon(Icons.email)
      ),
    onChange:(valor){
      setState((){ _email=valor;});
      },
    )
  },

  Widget _crearPassword(){

    return TextFiled(
      obscureText:true,
      decoration:InputDecoration(
      border:OutlineInputBorder(borderRadius:BorderRadius.circular(20.0))
      hintText:'Password',
      labelText:'Password',
      suffixIcon:Icon(Icons.lock_open),
      icon: Icon(Icons.lock)
      ),
      onChange:(valor){
        setState((){ _email=valor;});
      },
    )

  },

  Widget _crearFecha(BuildContext context){

    return TextFiled(
    controller:_inputFieldDateController
    enableInteractiveSelection:false,
    decoration:InputDecoration(
    border:OutlineInputBorder(borderRadius:BorderRadius.circular(20.0))
    hintText:'Fecha de Nacimiento',
    labelText:'Fecha de Nacimiento',
    suffixIcon:Icon(Icons.perm_contact_calender),
    icon: Icon(Icons.calender_today)
    ),
    onTap(){

      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);


      },
    )

  }, 
 _selectDate(BuildContext context) async{

  DateTime pickes =await showDatePicker(
    context:context,
    initialDate: new DateTime.now(),
    firstDate: new DateTime(2018),
    lastDate: new DateTime(2025),
    local:Locale('es','ES')
  );

    if (pickes != null){

      setState((){

        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;

      });

    }

  }

  Widget _crearPersona(){

    return ListTile(){
      title:Text('Nombre es:$_nombre'),
      subtitle:Text('Email:$_email'),
    };

  }
}