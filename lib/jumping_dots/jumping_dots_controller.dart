import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:learning_isolates/home/hotel_page_model.dart';

import '../routes/routes.dart';

class JumpingDotsController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController controller;
  RxList<CurvedAnimation> curvedController= <CurvedAnimation>[].obs;
  RxList<Animation<Offset>> slideTween = <Animation<Offset>>[].obs;

  @override
  onInit() {
    super.onInit();
    setValues();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  setValues() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: false);
    curvedController.value= List.generate(3, (index){
      final start= index*0.1;
      final end = start+0.5;
      return CurvedAnimation(parent: controller, curve: Interval(start,end));
    });
    slideTween.value = List.generate(3, (index){
      return Tween<Offset>(begin: Offset(0, -0.05),end:Offset(0, 0) ).animate(curvedController[index]);
    });
    refresh();
  }
}
