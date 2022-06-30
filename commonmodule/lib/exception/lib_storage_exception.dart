
import 'package:dio/dio.dart';

class LibStorageException implements Exception{

  final String _message;

  String get message{
    return _message;
  }

  LibStorageException(this._message);

  @override
  String toString() {
    return "$_message";
  }
}

class LibWarningStorageException implements Exception{

  final String _message;

  String get message{
    return _message;
  }

  LibWarningStorageException(this._message);

  @override
  String toString() {
    return "$_message";
  }
}