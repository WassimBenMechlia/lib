import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;

import '../exceptions/http_exception.dart' as http;
import '../response.dart';

abstract class NetworkService {
  Future<Either<http.AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<http.AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    dio.FormData? formData,
  });

  Future<Either<http.AppException, Response>> patch(
    String endpoint, {
    dio.FormData? data,
    Map<String, dynamic>? otherData,
  });

  Future<Either<http.AppException, Response>> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<http.AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}
