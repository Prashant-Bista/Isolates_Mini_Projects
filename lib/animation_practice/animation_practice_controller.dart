import 'dart:math' as math;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationPracticeController extends GetxController with SingleGetTickerProviderMixin{
  late AnimationController controller;
Rxn<double> buttonSize =Rxn<double>();
  Rxn<double> progress = Rxn<double>();
  Rxn<double> turns =Rxn<double>();
Rxn<Animation<double>> rotateTween = Rxn<Animation<double>>();
  Rxn<Animation<double>> scaleTween = Rxn<Animation<double>>();

  Rxn<Animation<Color?>> colorTween = Rxn<Animation<Color?>>();
  Rxn<Animation<Offset>> slideTween = Rxn<Animation<Offset>>();

  Rxn<math.Random> random= Rxn<math.Random>();
  Rxn<CurvedAnimation> curve = Rxn<CurvedAnimation>();

  @override
onInit(){
  super.onInit();
  setValues();
rotateTween.refresh();
}
  @override
  void onClose() {
    controller.dispose();    super.onClose();
  }
 setValues(){
   random.value = math.Random();
   buttonSize.value = 50;
   turns.value = 0.0;
   controller = AnimationController(
     vsync: this,
     duration: const Duration(seconds: 2),
   )..repeat(reverse: true);
   rotateTween.value =Tween<double>(begin: 0,end: 2*math.pi).animate(controller);
   colorTween.value = ColorTween(begin: Colors.blue,end: Colors.green).animate(controller);
   scaleTween.value = Tween<double>(begin: 0,end: 5).animate(controller);
   progress.value = 5.0;
   slideTween.value = Tween<Offset>(begin:Offset(0, 0),end:Offset(0, 0)).animate(controller);
   curve.value = CurvedAnimation(parent:controller,curve:Curves.easeInOutBack );
   refresh();
 }
 changeSize(){
   buttonSize.value = random.value!.nextInt(100).toDouble();
 }
 changeTurns(){
  turns.value = (random.value!.nextDouble())*2*math.pi;
 }

}