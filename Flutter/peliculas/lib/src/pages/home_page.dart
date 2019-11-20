import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cine'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[_swiperTarjetas()],
          ),
        ));
  }

  Widget _swiperTarjetas() {

PeliculaProvider peliculaProvider = new PeliculaProvider();

peliculaProvider.getEnCines();

    return CardSwiper(
      peliculas: [1, 2, 3, 4, 5],
    );
  }
}
