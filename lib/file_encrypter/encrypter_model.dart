import 'dart:io';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';

class AESModel{
  File? file;
  Key? key;
  IV? iv;
  AESModel({this.file,this.key,this.iv});
  factory AESModel.fromJson(Map<String,dynamic> json){
    return AESModel(
      file: json["file"],
        key: json["key"],
      iv:json["iv"]
    );
  }
  toJson(){
    return{
      "file": file,
      "key": key,
      "iv":iv,
    };
  }
}
class RSAModel{
  File? file;
  RSAPrivateKey? privateKey;
  RSAPublicKey? publicKey;
  IV? iv;
  RSAModel({this.file,this.privateKey,this.publicKey,this.iv});
  factory RSAModel.fromJson(Map<String,dynamic> json){
    return RSAModel(
        file: json["file"],
        privateKey: json["privateKey"],
        publicKey: json["publicKey"],
        iv:json["iv"]
    );
  }
  toJson(){
    return{
      "file": file,
      "privateKey": privateKey,
      "publicKey": publicKey,
      "iv":iv,
    };
  }
}