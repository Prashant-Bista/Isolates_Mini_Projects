import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:learning_isolates/animation_practice/animation_practice_controller.dart';

class AnimationPracticeView extends StatelessWidget {
  const AnimationPracticeView({super.key});

  @override
  Widget build(BuildContext context) {
    AnimationPracticeController controller = Get.put(
      AnimationPracticeController(),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: controller.controller,
              builder: (context, child) => Transform.scale(
                scaleX: controller.controller.value*5,
                child: Transform.rotate(angle:controller.rotateTween.value!.value ,child: Container(
                  height: 20,
                  width: 100,
                  color: controller.colorTween.value!.value,
                ),),
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: controller.curve.value!,
              builder: (context, child) => SlideTransition(
                position: controller.slideTween.value!,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.blue,
                  child: Text("Multiple Animations"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
