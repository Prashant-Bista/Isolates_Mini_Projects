import 'package:flutter/cupertino.dart';
import 'package:learning_isolates/home/home_page_view.dart';

import '../hero_try/hero_RouteA.dart';
import '../hero_try/hero_routeB.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    if (settings.name == "/") {
      return SlidingPageRouteBuilder(navigateTo: HomePageView());
    }
    if (settings.name == "/hero") {
      return SlidingPageRouteBuilder(navigateTo: RouteA());
    }
    if (settings.name == "/heroB") {
      return SlidingPageRouteBuilder(navigateTo: RouteB());
    }
  }
}

class SlidingPageRouteBuilder extends PageRouteBuilder {
  final Widget navigateTo;
  SlidingPageRouteBuilder({required this.navigateTo})
    : super(
        pageBuilder: (context, _, _) => navigateTo,
        transitionsBuilder:
            (context, animation, _, child) => FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation,),
              child: child,
            ),
      );
}
