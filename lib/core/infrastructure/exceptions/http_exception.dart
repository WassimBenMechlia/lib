import 'package:dartz/dartz.dart';

import '../response.dart';

class AppException implements Exception {
  final String description;
  final int code;
  final String identifier;

  AppException({
    required this.description,
    required this.code,
    required this.identifier,
  });

  @override
  String toString() {
    return 'code=$code\ndescription=$description\nidentifier=$identifier';
  }
}

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
