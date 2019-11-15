import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
           padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
         backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdWQFxIaXu9OTz0aIKbRrlHhKNidobYCALnWxk7Bxy42k7Q6vL&s'),
         radius: 25.0,
               
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://larepublica.pe/resizer/D315KrVGAREkqwSW-JFQt1ew-fY=/538x0/top/larepublica.pe/resizer/kMAp9uRwE1n4ZVLPBZq-MrWV6GE=/538x0/top/smart/arc-anglerfish-arc2-prod-gruporepublica.s3.amazonaws.com/public/GS3LHSA235E2RF4X5UPKENBPN4.png'),
          placeholder:AssetImage('assets/jar-loading.gif') ,
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
