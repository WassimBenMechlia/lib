import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../remote/network_service.dart';
import '../remote/network_util.dart';
import '../response.dart' as response;
import 'http_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>> handleException(
    Future<Response<dynamic>> Function() handler, {
    String endpoint = '',
  }) async {
    try {
      final res = await handler();
      if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
        return Right(
          response.Response(
            statusCode: res.statusCode ?? 200,
            data: res.data,
            statusMessage: res.statusMessage ?? '',
          ),
        );
      } else {
        return Left(
          AppException(
            description:
                (res.data is Map && res.data.containsKey('message'))
                    ? res.data['message']
                    : (res.data is Map && res.data.containsKey('Description'))
                    ? res.data['Description']
                    : (res.data is Map && res.data.containsKey('Message'))
                    ? res.data['Message']
                    : "Unknown error",
            code: res.statusCode ?? 500,
            identifier: "1",
          ),
        );
      }
    } catch (e, stackTrace) {
      log(
        'Exception caught: ${e.runtimeType}',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(await _mapExceptionToAppException(e, endpoint));
    }
  }

  Future<AppException> _mapExceptionToAppException(
    Object error,
    String endpoint,
  ) async {
    String message = 'An unexpected error occurred';
    String identifier = 'UnknownException';
    int statusCode = 0;

    if (error is SocketException) {
      message = 'No internet connection. Please check your network settings.';
      identifier = 'SocketException at $endpoint: ${error.message}';
    } else if (error is DioException) {
      statusCode = error.response?.statusCode ?? 0;
      message = await _getMessageForStatusCode(statusCode, error);

      identifier = 'DioException at $endpoint: ${error.message}';
    } else {
      identifier = 'UnknownException at $endpoint: ${error.toString()}';
    }

    return AppException(
      description: message,
      code: statusCode,
      identifier: identifier,
    );
  }

  Future<String> _getMessageForStatusCode(
    int statusCode,
    DioException error,
  ) async {
    final hasInternet = await NetworkUtils.hasInternetAccess();
    if (!hasInternet) {
      return "No internet connection. Please check your network settings.";
    }

    final responseData = error.response?.data;
    String serverMessage = '';

    if (responseData is Map<String, dynamic>) {
      serverMessage =
          responseData['message'] ?? responseData['Description'] ?? '';
    }

    const defaultMessages = <int, String>{
      400: 'Bad Request: The server could not understand the request.',
      401: 'Unauthorized: Access is denied due to invalid credentials.',
      403: 'Forbidden: You do not have permission to access this resource.',
      404: 'Not Found: The requested resource could not be found.',
      408: 'Request Timeout: The server timed out waiting for the request.',
      500: 'Internal Server Error: The server encountered an error.',
      502: 'Bad Gateway: The server received an invalid response.',
      503: 'Service Unavailable: The server is currently unavailable.',
      504: 'Gateway Timeout: The server did not receive a timely response.',
    };

    return serverMessage.isNotEmpty
        ? serverMessage
        : defaultMessages[statusCode] ??
            'An error occurred with status code $statusCode.';
  }
}
