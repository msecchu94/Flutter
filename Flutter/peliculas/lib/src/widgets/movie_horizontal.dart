import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;
    return Container(
      height: _screensize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1, 
          viewportFraction: 0.3,
          ),
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 130.0,
              ),
            ),

            SizedBox(height: 5.00),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
