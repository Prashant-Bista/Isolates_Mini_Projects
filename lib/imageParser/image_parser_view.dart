import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/imageParser/image_parser_controller.dart';

class ImageParserView extends StatelessWidget {
  ImageParserView({super.key});
  ImageParserController imageParserController = Get.put(
    ImageParserController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () =>
                  imageParserController.pickedFile.value != null
                      ? Image.file(imageParserController.pickedFile.value!)
                      : SizedBox(),
            ),
           Row(
            children: [
               ElevatedButton(
              onPressed: () {
                imageParserController.pickImage();
              },
              child: Column(
                children: [Icon(Icons.upload), Text("Pick an Image")],
              ),
            ),
            ElevatedButton(
              onPressed: () async{
                imageParserController.processImage();
              },
              child: Column(
                children: [Icon(Icons.upload), Text("Filter  Image")],
              ),
            ),
            Obx(()=>imageParserController.filterImageLoader()??SizedBox()),
            ElevatedButton(
              onPressed: () {
                imageParserController.saveImage();
              },
              child: Column(
                children: [Icon(Icons.upload), Text("Save Image")],
              ),
            ),
            ],
           )
          ],
        ),
      ),
    );
  }

}
