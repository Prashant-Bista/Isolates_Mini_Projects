import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageParserController extends GetxController{
  Rxn<File> pickedFile= Rxn<File>();
  Rxn<img.Image> imageFile = Rxn<img.Image>();
  Future<void> pickImage()async{
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(type: FileType.image);
    if(filePickerResult!=null){
          pickedFile.value = File(filePickerResult.files.single.path!);
          pickedFile.refresh();
    }
   
  }
   Future<void> processImage() async{
      Uint8List? imageBytes = await pickedFile.value?.readAsBytes();
      imageFile.value= await img.decodeJpg(imageBytes!);
      imageFile.value = img.sepia(imageFile.value!);
      imageFile.refresh();
    }

    Widget? filterImageLoader(){
      if(pickedFile.value!=null){
Uint8List imageBytes =  img.encodeJpg(imageFile.value!);
      return Image.memory(imageBytes);
      }
      else{
        return null;
      }
    }
      
    Future<void> saveImage()async{
            Uint8List imageBytes = img.encodeJpg(imageFile.value!);
      Directory dir = await getApplicationDocumentsDirectory();
      await File("${dir.path}/sepia2.jpg").writeAsBytes(imageBytes);

    }
}