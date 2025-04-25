import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/file_encrypter/file_encrypter_controller.dart';

class FileEncrypterView extends StatelessWidget {
   FileEncrypterView({super.key});
   FileEncrypterController fileEncrypterController = Get.put(FileEncrypterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Encrypter"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            fileEncrypterController.pickFile();
          }, child: Text("Pick a file")),
         Obx(()=> fileEncrypterController.file.value!=null?Column(
           children: [
             Text(fileEncrypterController.file.value!.path),

          ElevatedButton(onPressed: (){
fileEncrypterController.encryptAES();
}, child: Text("Encrypt")),
             ElevatedButton(onPressed: (){
               fileEncrypterController.decryptAES();
             }, child: Text("Decrypt"))
           ],
    ):SizedBox())
    ]));
  }


}
