import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_isolates/routes/route_constants.dart';

class RouteController extends GetxController {
  StatefulNavigationShell? sns;
  BuildContext? ctx;

  setStatefulNavigationShell(StatefulNavigationShell sns) {
    this.sns = sns;
  }

  setContext(BuildContext context) {
    ctx = context;
  }

  routeToHomePage({bool shouldRemovePrevious = false}) {
    if (ctx != null) {
      if (shouldRemovePrevious) {
        ctx?.goNamed(RouteConstants.routeHomePage);
      }
      else {
        ctx?.pushNamed(RouteConstants.routeHomePage);
      }
    }
  }


    routeToImageParser({bool shouldRemovePrevious = false}) {
      if (ctx != null) {
        if (shouldRemovePrevious) {
          ctx?.goNamed(RouteConstants.routeImageParser);
        }
        else {
          ctx?.pushNamed(RouteConstants.routeImageParser);
        }
      }
    }
    routeToRiveExample({bool shouldRemovePrevious = false}) {
      if (ctx != null) {
        if (shouldRemovePrevious) {
          ctx?.goNamed(RouteConstants.routRiveExample);
        }
        else {
          ctx?.pushNamed(RouteConstants.routRiveExample);
        }
      }
    }
    routeToFileEncrypter({bool shouldRemovePrevious = false}) {
      if (ctx != null) {
        if (shouldRemovePrevious) {
          ctx?.goNamed(RouteConstants.routeFileEncrypt);
        }
        else {
          ctx?.pushNamed(RouteConstants.routeFileEncrypt);
        }
      }
    }
  routeToHeroTryRouteA({bool shouldRemovePrevious = false}) {
    if (ctx != null) {
      if (shouldRemovePrevious) {
        ctx?.goNamed(RouteConstants.routeFlutterHeroTryRouteA);
      }
      else {
        ctx?.pushNamed(RouteConstants.routeFlutterHeroTryRouteA);
      }
    }
  }
  routeToHeroTryRouteB({bool shouldRemovePrevious = false}) {
    if (ctx != null) {
      if (shouldRemovePrevious) {
        ctx?.goNamed(RouteConstants.routeFlutterHeroTryRouteB);
      }
      else {
        ctx?.pushNamed(RouteConstants.routeFlutterHeroTryRouteB);
      }
    }
  }

  routeToImplicitAnimations({bool shouldRemovePrevious = false}) {
      if (ctx != null) {
        if (shouldRemovePrevious) {
          ctx?.goNamed(RouteConstants.routeImplicitAnimations);
        }
        else {
          ctx?.push(RouteConstants.routeImplicitAnimations);
        }
      }
    }
    routeToFlutterLogoRotator({bool shouldRemovePrevious=false}){
    if(ctx!=null){
      if(shouldRemovePrevious){
        ctx?.goNamed(RouteConstants.routeFlutterLogoRotator);
      }
      else{
        ctx?.pushNamed(RouteConstants.routeFlutterLogoRotator);
      }
    }
    }
  }
