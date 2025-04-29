import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/home/home_page_controller.dart';
import 'package:learning_isolates/routes/routes.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: AnimatedBuilder(
        animation: controller.controller,
        builder:
            (context, child) => ListView.builder(
              itemCount: controller.homePageData.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: controller.curvedController[index],
                  builder: (context, child) {
                    return SlideTransition(
                      position: controller.slideTween[index],
                      child: child,
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 150),
                    child: MaterialButton(
                      height: 30,
                      color: Colors.blue,
                      onPressed: () {
                        controller.homePageData[index].routeController();
                      },
                      child: Column(
                        children: [
                          Icon(
                            controller.homePageData[index].iconData,
                            size: 20,
                            color: Colors.red,
                          ),
                          Text(controller.homePageData[index].name),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
