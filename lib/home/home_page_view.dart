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
          ),)

        ],
      ),
    );
  }
}
