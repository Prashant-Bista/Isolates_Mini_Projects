import 'package:flutter/material.dart';
import '';
import 'package:get/get.dart';

class LogoRotatorController extends GetxController with SingleGetTickerProviderMixin{
  Rxn<AnimationController> animationController =Rxn<AnimationController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController.value = AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.value?.dispose();
  }
  getAnimation(){
    return animationController;
  }

}