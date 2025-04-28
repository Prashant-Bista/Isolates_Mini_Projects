import 'package:flutter/material.dart';

class RouteB extends StatelessWidget {
  const RouteB({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("RouteB")), body:  Hero(
      tag: 'FlutterLogo',
      child: FlutterLogo(size: 80,),
    ),)  ;
  }
}