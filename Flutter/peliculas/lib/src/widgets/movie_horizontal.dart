import 'package:flutter/material.dart';

class MovieHorizontal extends StatelessWidget {

final List<Pelicula> peliculas ;

MovieHorizontal({@required this.peliculas})

  @override
  Widget build(BuildContext context) {
    
    final _screensize = MediaQuery.of(context).size;
    return Container(
      height : _screensize.height = 0.2,
      child: PageView(
      pageSnapping:false,
      controller:PageController(
      initialPage:1,
      viewportFraction:0.3
      ),
      children:_tarjetas(context),
      ),
    );
  }

  List<Widget>_tarjetas(BuildContext context){

    return peliculas.map((pelicula){

      return Container(

        margin : EdgeInserts.only(right:15.0),
        child:Column(
          children;<Widget>[
            ClipRRect(
              FadeInImage(
                    image:NetworkImage(peliculas.getPosterImg()),
                    placeholder:AssetImage('assets/img/no-image.jpg'),
                    fit:BoxFit.cover,
                    height:160.0,
              ),
            )
            SizedBox(height:5.0),
            Text(
            pelicula.title,
            overflow:TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.caption,

            )
          ],
            
        ),

      );
    }).toList();
  }
}