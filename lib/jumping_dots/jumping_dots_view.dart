import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/jumping_dots/jumping_dots_controller.dart';

class JumpingDotsView extends StatelessWidget {
  JumpingDotsView({super.key});
  JumpingDotsController controller = Get.put(JumpingDotsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller.curvedController[index],
            builder:
                (context, child) => SlideTransition(
                  position: controller.slideTween[index],
                  child: child,
                ),
            child: CircleAvatar(radius: 5, backgroundColor: Colors.blue),
          );
        },
      ),
    );
  }
}
