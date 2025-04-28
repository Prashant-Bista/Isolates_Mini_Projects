import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/animation_library/animation_library_controller.dart';

// class LogoRotator extends StatefulWidget {
//   const LogoRotator({super.key});
//
//   @override
//   State<LogoRotator> createState() => _LogoRotatorState();
// }
//
// class _LogoRotatorState extends State<LogoRotator>
//     with TickerProviderStateMixin {
//   late AnimationController animationController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     )..repeat();
//   }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     animationController.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return RotatingLogo(controller: animationController);
//   }
// }

class LogoRotator extends StatelessWidget {
  LogoRotator({super.key});
  LogoRotatorController animationController = Get.put(LogoRotatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedBuilder(
        animation: animationController.colorTween.value!,
        builder:
            (context, child) {
          final scale = 1 -(animationController.animationController.value!.value*0.5);
          final newPos = 20 +(animationController.animationController.value!.value *400);
              return Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()..scale(scale)..translate(newPos,newPos),
              child: child,
                  )
                ],
              );
            },
        child: MaterialButton(
            color: Colors.blue,
            elevation: 50,
            onPressed:(){
          animationController.onPressed();
        }, child: Text("Move me")),
                )
    );
  }
}

class Logo extends AnimatedWidget {
  Animation<double> controller;
  Logo({required this.controller}) : super(listenable: controller);
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerticalDivider(
            thickness: 20,
          ),
          SizedBox(
            height:200,width:200,child:Transform(
            transform: Matrix4.skewY(0.5)..rotateY(controller.value),
            child: FlutterLogo(size:80)),
          ),
        ],
      ),
    );
  }
}






