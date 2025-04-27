import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../util/app_client.dart';
import '../exceptions/exception_handler_mixin.dart';
import '../exceptions/http_exception.dart';
import '../response.dart' as response;
import 'network_service.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final ApiClient apiClient;

  DioNetworkService(this.apiClient);

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    final res = handleException(() async {
      return apiClient.dio.post(endpoint, data: data ?? formData);
    }, endpoint: endpoint);

    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = handleException(
      () => apiClient.dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(
    String endpoint, {
    FormData? data,
    Map<String, dynamic>? otherData,
  }) async {
    final res = handleException(
      () => apiClient.dio.patch(
        endpoint,
        data: data ?? otherData,
        options: Options(headers: apiClient.dio.options.headers),
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = handleException(
      () => apiClient.dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: apiClient.dio.options.headers),
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final res = handleException(
      () => apiClient.dio.put(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: apiClient.dio.options.headers),
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
