import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PDFDownloadController extends GetxController {
  Dio dio = Dio();
  downloadPDF() async {
    Directory? dir = await getDownloadsDirectory();
    await dio.download(
      "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      "${dir!.path}/downloaded.pdf",
      onReceiveProgress: (hi, hello) {
        if (hi != -1 && hello !=-1) {
          print("$hi === $hello");
        }
      },
    );
  }
}
