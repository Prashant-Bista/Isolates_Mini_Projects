import 'package:flutter/material.dart';
import 'package:learning_isolates/routes/routes.dart';

class RouteA extends StatelessWidget {
  const RouteA({super.key});
  @override
  Widget build(BuildContext context) {

return Scaffold( appBar:AppBar(title: Text("RouteA"),),body:  Hero(

    tag: 'FlutterLogo',
    child: InkWell(
        onTap: (){
          routeController.routeToHeroTryRouteB();
        },
        child: FlutterLogo(size: 20,)),
),)  ;
  }
}