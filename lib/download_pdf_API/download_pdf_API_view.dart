import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/download_pdf_API/donwload_pdf_controller.dart';

class DownloadPdfApiView extends StatelessWidget {
   DownloadPdfApiView({super.key});
   final pdfDownloadController = Get.put(PDFDownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          IconButton(onPressed: (){
            pdfDownloadController.downloadPDF();
          }, icon: Icon(Icons.download))
        ],
      )

    );
  }
}
