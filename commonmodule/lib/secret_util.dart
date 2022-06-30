import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:io';

class SecretUtil {
  // md5
  static String hashMD5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
  // md5 文件
  static String hashPathMD5(String path) {
    var file = File(path);
    var digest = md5.convert(file.readAsBytesSync());
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  //base64
  static String encodeBase64(String data){
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  //Base64
  static String decodeBase64(String data){
    return String.fromCharCodes(base64Decode(data));
  }

  //aes 加密
  /*简单使用
  * var password = AESUtil.encodeAES(
        '123456', 'your keyStr', 'your ivStr');//your keyStr 如0123456776543210
  * */
  static String encryptAES(String data, {String keyStr = "DEFSAFE_12345678", String ivStr = "DEFA_IV_12345678"}) {

    final plainText = data;
    final key = Key.fromUtf8(keyStr);
    final iv = IV.fromUtf8(ivStr);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  //aes 解密
  static String decryptAES(String data, {String keyStr = "DEFSAFE_12345678", String ivStr = "DEFA_IV_12345678"}) {

    final plainText = data;
    final key = Key.fromUtf8(keyStr);
    final iv = IV.fromUtf8(ivStr);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.decrypt(Encrypted.fromBase64(plainText),iv: iv);
    return encrypted;
  }

  //sha1
  static String encryptSha1(String data) {
    var bytes = utf8.encode(data);
    var digest = sha1.convert(bytes).bytes;
    return hex.encode(digest);
  }

  //sha256
  static String encryptSha256(String data) {
    var bytes = utf8.encode(data);
    var digest = sha256.convert(bytes).bytes;
    return hex.encode(digest);
  }


}