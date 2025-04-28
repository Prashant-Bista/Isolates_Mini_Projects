import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/implicit_animation/implicit_animation_controller.dart';

class ImplicitAnimationView extends StatelessWidget {
  ImplicitAnimationView({super.key});

  ImplicitAnimationController implicitAnimationController = Get.put(
    ImplicitAnimationController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Container(color:Colors.red,child: FlutterLogo(size: 200,style: FlutterLogoStyle.markOnly,))],
      ),
      floatingActionButton: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              implicitAnimationController.value.value += 5;
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              implicitAnimationController.value.value -= 5;
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
