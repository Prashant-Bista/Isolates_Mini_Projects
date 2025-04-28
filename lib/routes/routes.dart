import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_isolates/file_encrypter/file_encrypter_view.dart';
import 'package:learning_isolates/hero_try/hero_RouteA.dart';
import 'package:learning_isolates/home/home_page_view.dart';
import 'package:learning_isolates/imageParser/image_parser_view.dart';
import 'package:learning_isolates/implicit_animation/implicit_animation_view.dart';
import 'package:learning_isolates/riveexample/rive_example_view.dart';
import 'package:learning_isolates/routes/route_constants.dart';
import 'package:learning_isolates/routes/route_controller.dart';

import '../animation_library/animation_library_view.dart';
import '../hero_try/hero_routeB.dart';

RouteController routeController = Get.put(RouteController());
GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  initialLocation: RouteConstants.routeHomePage,
  routes: [
    GoRoute(
      name: RouteConstants.routeHomePage,
      path: RouteConstants.routeHomePage,
      builder: (context, state) {
        routeController.setContext(context);
        return HomePageView(key: state.pageKey);
      },
      routes: [
        GoRoute(
          path: RouteConstants.routeImageParser,
          name: RouteConstants.routeImageParser,
          builder: (context, state) {
            routeController.setContext(context);
            return ImageParserView(key: state.pageKey);
          },
        ),
        GoRoute(
          path: RouteConstants.routRiveExample,
          name: RouteConstants.routRiveExample,
          builder: (context, state) {
            routeController.setContext(context);
            return RiveExampleView(key: state.pageKey);
          },
        ),
        GoRoute(
          path: RouteConstants.routeFileEncrypt,
          name: RouteConstants.routeFileEncrypt,
          builder: (context, state) {
            routeController.setContext(context);
            return FileEncrypterView(key: state.pageKey);
          },
        ),
        GoRoute(
          path: RouteConstants.routeImplicitAnimations,
          name: RouteConstants.routeImplicitAnimations,
          builder: (context, state) {
            routeController.setContext(context);
            return ImplicitAnimationView(key: state.pageKey);
          },
        ),
        GoRoute(path: RouteConstants.routeFlutterLogoRotator,name: RouteConstants.routeFlutterLogoRotator,builder: (context,state){
          routeController.setContext(context);
          return LogoRotator(key: state.pageKey,);
        }),
        GoRoute(path: RouteConstants.routeFlutterHeroTryRouteA,name: RouteConstants.routeFlutterHeroTryRouteA,builder: (context,state){
          routeController.setContext(context);
          return RouteA(key: state.pageKey,);
        }),
        GoRoute(path: RouteConstants.routeFlutterHeroTryRouteB,name: RouteConstants.routeFlutterHeroTryRouteB,builder: (context,state){
          routeController.setContext(context);
          return  RouteB(key: state.pageKey,);
        }),
        

      ],
    ),
  ],
);
