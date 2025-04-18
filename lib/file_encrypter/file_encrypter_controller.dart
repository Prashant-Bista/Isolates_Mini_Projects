import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:learning_isolates/file_encrypter/encrypter_model.dart';
import 'package:path_provider/path_provider.dart';

class FileEncrypterController extends GetxController {
  Rxn<File> file = Rxn<File>();
  Rxn<SendPort> sendPortEnc = Rxn<SendPort>();
  Rxn<Encrypter> encrypter = Rxn<Encrypter>();

  encryptAES({required AESModel aesModel}) {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen(handleResponseFromIsolate);
    Isolate.spawn((dynamic sendport) async {
      ReceivePort receivePort = ReceivePort();
      sendport.send(receivePort.sendPort);

      receivePort.listen((dynamic aes) async {
        if (aes is AESModel) {
          Uint8List fileBytes = await file.value!.readAsBytes();
          encrypter.value = Encrypter(AES(aes.key!));
          Encrypted encrypted = encrypter.value!.encryptBytes(
              fileBytes, iv: aes.iv);
          Directory dir = await getApplicationDocumentsDirectory();
          await File(dir.path).writeAsBytes(encrypted.bytes);
        }
      }
      );
    }
        , receivePort.sendPort
    );
  }

  encryptRSA() {
    ReceivePort receivePort = ReceivePort();
    receivePort.listen(handleResponseFromIsolate);
    Isolate.spawn((SendPort sendPort) {
      ReceivePort receivePort = ReceivePort();
      sendPort.send(receivePort.sendPort);
      receivePort.listen((dynamic message) async {
        if (message is RSAModel) {
          encrypter.value = Encrypter(RSA(
            privateKey: message.privateKey!, publicKey: message.publicKey!,));
          Uint8List fileBytes = await file.value!.readAsBytes();
          Encrypted enctypted = encrypter.value!.encryptBytes(fileBytes);
          Directory dir = await getApplicationDocumentsDirectory();
          File("$dir").writeAsBytes(enctypted.bytes);
        }
      });
    }, receivePort.sendPort);
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
        allowedExtensions: ["txt", "doc", "docx", "pdf"]);
    if (filePickerResult != null) {
      file.value = await File(filePickerResult.files.single.path!);
      file.refresh();
    }
  }
}