import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class LogoRotatorController extends GetxController with SingleGetTickerProviderMixin{
  Rxn<AnimationController> animationController = Rxn<AnimationController>();
  Rxn<CurvedAnimation> curveController = Rxn<CurvedAnimation>();
  Rxn<ReverseAnimation> reverseController = Rxn<ReverseAnimation>();
  Rxn<Animation<double>> tween = Rxn<Animation<double>>();
  Rxn<Animation<Color?>> colorTween = Rxn<Animation<Color?>>();
  @override
  onInit(){
    super.onInit();
    setInitialValues();
  }
//   @override
//   dispose{
//     super.dispose();
//     animationController.value!.dispose();
// }
  setInitialValues(){
    animationController.value =AnimationController(vsync: this,duration: Duration(seconds: 5))..repeat(reverse: true);
    curveController.value= CurvedAnimation(parent: animationController.value!, curve: Curves.bounceIn);
    reverseController.value = ReverseAnimation(curveController.value!);
    tween.value = Tween<double>(begin: 0,end: 2*math.pi).animate(animationController.value!);
    colorTween.value = ColorTween(begin: Colors.green,end:Colors.red).animate(animationController.value!);
  }

  onPressed(){
    print("pressed");
    // if(animationController.value!.status == AnimationStatus.completed){
    //   animationController.value!.forward();
    //   print("inside if");
    // }
    // else{
    //   animationController.value!.reverse();
    //   print("inside else");
    //
    // }
    // refresh();
  }
}