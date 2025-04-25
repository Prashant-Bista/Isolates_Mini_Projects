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

  @override
  LogoRotatorController animationController = Get.put(LogoRotatorController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => RotatingLogo(
          controller: animationController.animationController.value!,
        ),
      ),
    );
  }
}

class RotatingLogo extends AnimatedWidget {
  AnimationController _controller;
  RotatingLogo({required AnimationController controller})
    : _controller = controller,
      super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: _controller.value*2*math.pi,child: Center(child: FlutterLogo(),));
  }
}
