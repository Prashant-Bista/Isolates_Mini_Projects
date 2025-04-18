import 'dart:io';
import 'dart:isolate';

import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class FileEncrypterController extends GetxController {
  RxBool isRSA= false.obs;
  Rxn<File> file = Rxn<File>();
  Rxn<SendPort> sendPortEnc = Rxn<SendPort>();
  Rxn<Encrypter> encrypter = Rxn<Encrypter>();
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

  encryptAES() {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen(handleResponseFromIsolate);

    Isolate.spawn((dynamic json) async {

      Key key = Key.fromLength(32);
      BackgroundIsolateBinaryMessenger.ensureInitialized(json["token"]);
      Uint8List fileBytes = await json["file"].readAsBytes();

      json["encrypter"] = Encrypter(AES(key));

      Encrypted encrypted = json["encrypter"].encryptBytes(
          fileBytes, iv: IV.fromLength(8));

      Directory dir = await getApplicationDocumentsDirectory();

      await File("${dir.path}/encryptedPdf.pdf").writeAsBytes(encrypted.bytes);

    },{"file":file.value,"encrypter":encrypter.value,"token":rootIsolateToken});

  }

  // encryptRSA() {
  //   ReceivePort receivePort = ReceivePort();
  //   receivePort.listen(handleResponseFromIsolate);
  //   Isolate.spawn((SendPort sendPort) {
  //     ReceivePort receivePort = ReceivePort();
  //     sendPort.send(receivePort.sendPort);
  //     receivePort.listen((dynamic message) async {
  //       if (message is RSAModel) {
  //         encrypter.value = Encrypter(RSA(
  //           privateKey: message.privateKey!, publicKey: message.publicKey!,));
  //         Uint8List fileBytes = await file.value!.readAsBytes();
  //         Encrypted enctypted = encrypter.value!.encryptBytes(fileBytes);
  //         Directory dir = await getApplicationDocumentsDirectory();
  //         File("$dir").writeAsBytes(enctypted.bytes);
  //       }
  //     });
  //   }, receivePort.sendPort);
  // }

  void handleResponseFromIsolate(dynamic message) {
    if (message is SendPort) {
      sendPortEnc.value = message;
      sendPortEnc.refresh();
    }
    else if (message is String) {
    }
  }
  Future<void> pickFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["txt", "doc", "docx", "pdf"]);
    if (filePickerResult != null) {
      file.value =  File(filePickerResult.files.single.path!);
      file.refresh();
    }
  }
  void toggleAlgoChoice(bool value){
    isRSA.value=value;
    isRSA.refresh();
  }

}
