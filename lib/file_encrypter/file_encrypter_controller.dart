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
  Key key = Key.fromLength(32);
  IV iv = IV.fromLength(8);
  Rxn<SendPort> sendPortEnc = Rxn<SendPort>();
  Rxn<Encrypter> encrypter = Rxn<Encrypter>();
  Rxn<Encrypter> decryptor = Rxn<Encrypter>();
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

  encryptAES() {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen(handleResponseFromIsolate);

    Isolate.spawn((dynamic json) async {
      SendPort sendPort = json["sendport"];
      sendPort.send(json["key"]);
      BackgroundIsolateBinaryMessenger.ensureInitialized(json["token"]);
      Uint8List fileBytes = await json["file"].readAsBytes();
      json["encrypter"] = Encrypter(AES(json["key"]));

      Encrypted encrypted = json["encrypter"].encryptBytes(
          fileBytes, iv: json["IV"]);

      Directory dir = await getApplicationDocumentsDirectory();

      await File("${dir.path}/encryptedPdf.pdf.enc").writeAsBytes(encrypted.bytes);
    },{"file":file.value,"token":rootIsolateToken,"sendport":receivePort.sendPort,"key":key,"IV":iv});

  }

 decryptAES(){
    ReceivePort receivePort = ReceivePort();
    receivePort.listen(handleResponseFromIsolate,);
    Isolate.spawn((dynamic json)async{
      File file = json["file"];
      Uint8List fileBytes = await file.readAsBytes();
      Encrypted encrypted = Encrypted(fileBytes);
      BackgroundIsolateBinaryMessenger.ensureInitialized(json["token"]);
      Encrypter encrypter  = Encrypter(AES(json["key"]));
      final decrypted = await encrypter.decryptBytes(encrypted,iv: json["IV"]);
      Directory dir = await getApplicationDocumentsDirectory();
      await File("${dir.path}/decrypted.pdf").writeAsBytes(decrypted,flush: true);
    },{"file": file.value,"key":key,"token":rootIsolateToken,"IV":iv},);
 }

  void handleResponseFromIsolate(dynamic message) {
    if (message is SendPort) {
      sendPortEnc.value = message;
      sendPortEnc.refresh();
    }
    else if (message is String) {
     print(message);
    }
  }
  Future<void> pickFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["txt", "doc", "docx", "pdf","enc"]);
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
