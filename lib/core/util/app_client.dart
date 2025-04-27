import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class ApiClient {
  final Dio dio = createDio();

  static Dio createDio() {
    final talker = Talker();

    final dio = Dio(
      BaseOptions(
        baseUrl: "https://516b-102-106-251-231.ngrok-free.app",
        validateStatus: (status) => status != null,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (
      client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          printRequestData: true,
        ),
      ),
    );

    return dio;
  }
}
