import 'package:flutter/material.dart';
import 'package:learning_isolates/routes/routes.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(color:Colors.blue,onPressed:(){
            routeController.routeToImageParser();
          },child: Column(
            children: [Icon(Icons.image,color: Colors.red,),Text("Image Parser")],
          ),),

          MaterialButton(color:Colors.blue,onPressed:(){
            routeController.routeToRiveExample();
          },child: Column(
            children: [Icon(Icons.r_mobiledata,color: Colors.red,),Text("Rive Example")],
          ),),
          MaterialButton(color:Colors.blue,onPressed:(){
            routeController.routeToFileEncrypter();
          },child: Column(
            children: [Icon(Icons.enhanced_encryption,color: Colors.red,),Text("File Encrypter")],
          ),),
          MaterialButton(color:Colors.blue,onPressed:(){
            routeController.routeToImplicitAnimations();
          },child: Column(
            children: [Icon(Icons.animation,color: Colors.red,),Text("Implicit Animations")],
          ),),
          MaterialButton(color:Colors.blue,onPressed:(){
            routeController.routeToFlutterLogoRotator();
          },child: Column(
            children: [Icon(Icons.flutter_dash,color: Colors.red,),Text("Logo Rotator")],
          ),)



        ],
      ),
    );
  }
}
