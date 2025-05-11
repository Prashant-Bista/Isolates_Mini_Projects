import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/home/hotel_page_model.dart';

import '../routes/routes.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController controller;
   RxList<CurvedAnimation> curvedController= <CurvedAnimation>[].obs;
  RxList<Animation<Offset>> slideTween = <Animation<Offset>>[].obs;
  List<HomePageModel> homePageData = [
    HomePageModel(
      routeController: routeController.routeToImageParser,
      iconData: Icons.image,
      name: "Image Parser",
    ),
    HomePageModel(
      routeController: routeController.routeToRiveExample,
      iconData: Icons.r_mobiledata,
      name: "Rive Example",
    ),
    HomePageModel(
      routeController: routeController.routeToFileEncrypter,
      iconData: Icons.enhanced_encryption,
      name: "File Encrypter",
    ),
    HomePageModel(
      routeController: routeController.routeToImplicitAnimations,
      iconData: Icons.animation,
      name: "Implicit Animations",
    ),
    HomePageModel(
      routeController: routeController.routeToFlutterLogoRotator,
      iconData: Icons.flutter_dash,
      name: "Logo Rotator",
    ),
    HomePageModel(
      routeController: routeController.routeToHeroTryRouteA,
      iconData: Icons.flutter_dash,
      name: "Hero Try",
    ),
    HomePageModel(
      routeController: routeController.routeToAnimationPractice,
      iconData: Icons.flutter_dash,
      name: "Animation Practice",
    ),
    HomePageModel(
      routeController: routeController.routeToJumpingDots,
      iconData: Icons.sports_volleyball,
      name: "Jumping dots",
    ),
    HomePageModel(
      routeController: routeController.routeToDocumentScanner,
      iconData: Icons.document_scanner,
      name: "Document Scanner ",
    ),
    HomePageModel(
      routeController: routeController.routeToDocumentDownload,
      iconData: Icons.download,
      name: "Document Scanner ",
    )

  ];

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
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    curvedController.value = List.generate(homePageData.length, (index){
      final start = index*0.1;
      final end = start+0.1;
     return CurvedAnimation(parent: controller, curve: Interval(start,end,curve: Curves.easeOut));
    });
    slideTween.value = List.generate(homePageData.length, (index)=>Tween<Offset>(begin:Offset(-0.2, -0.2),end:Offset(0.2, 0.2)).animate(curvedController[index]));
    refresh();
  }
}
