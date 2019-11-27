import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 15.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
    );
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Lago de Noche', style: estiloTitulo),
                SizedBox(height: 7.0),
                Text('Lago en Bariloche,Argentina', style: estiloSubTitulo)
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red, size: 30.0),
          Text('41', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE')
      ],
    );
  }

  Widget _accion(IconData iconData, String text) {
    return Column(
      children: <Widget>[
        Icon(iconData, color: Colors.blue, size: 32.0),
        SizedBox(height: 5.0),
        Text(text, style: TextStyle(color: Colors.blue, fontSize: 15.0))
      ],
    );
  }

  _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Text(
          'El paisaje ha sido uno de los motores de la evolución de la historia de la fotografía. La mirada fotográfica más antigua de la que tenemos conocimiento resulta ser un paisaje rural que Nicéphore Niepce nos legó en su Vista desde la ventana en Gras, 1826.',
          textAlign: TextAlign.justify),
    );
  }
}
