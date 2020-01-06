import 'package:beats_app/src/models/producto_model.dart';
import 'package:beats_app/src/providers/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductosProvider>(context);
    return Container(
        height: 300.0,
        width: double.infinity,
        child: PageView(
            controller: PageController(viewportFraction: 0.8),
            children: productos.productos.map((prod) => _Card(prod)).toList()));
  }
}

class _Card extends StatelessWidget {
  ProductoModel prod;
  _Card(this.prod);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _primeraDescripcion(prod),
              SizedBox(
                width: 40.0,
              ),
              _cardDescripcion(prod)
            ],
          ),
          Positioned(
            top: 15,
            left: 40,
            child: Image(
              image: AssetImage('assets/${prod.url}'),
              width: 145.0,
            ),
          )
        ],
      ),
    );
  }
}

class _primeraDescripcion extends StatelessWidget {
  ProductoModel pro;
  _primeraDescripcion(this.pro);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 12.0),
            SizedBox(width: 10.0),
            Text('${pro.bateria}:40 Hours Baterry',
                style: TextStyle(fontSize: 10.0)),
            SizedBox(width: 30.0),
            Icon(FontAwesomeIcons.wifi, size: 12.0),
            SizedBox(width: 10.0),
            Text('Batery:40 hours', style: TextStyle(fontSize: 10.0)),
          ],
        ),
      ),
    );
  }
}

class _cardDescripcion extends StatelessWidget {
  ProductoModel prod;
  _cardDescripcion(this.prod);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: size.width * 0.5,
          height: 360.0,
          color: Color(prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(prod.titulo,
                        style: TextStyle(
                            color: Colors.white24,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Text(prod.subtitulo,
                        style: TextStyle(
                            color: Colors.white24,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(prod.nombre,
                        style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 15.0),
                  Container(
                    child: Text('\$${prod.precio}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  Container(
                    child: Center(
                      child: Text('Add to bag',
                          style: TextStyle(color: Colors.white)),
                    ),
                    width: 120.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15.0))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
