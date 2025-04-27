import 'package:dartz/dartz.dart';
import 'package:smart_hotel/core/infrastructure/exceptions/http_exception.dart';

import '../core/infrastructure/remote/network_service.dart';
import '../models/user_model.dart';

class AuthService {
  final NetworkService networkService;

  AuthService(this.networkService);

  Future<Either<AppException, UserModel>> login(
    String email,
    String password,
  ) async {
    final response = await networkService.post(
      '/auth/signin',
      data: {'email': email, 'motdepasse': password},
    );

    return response.fold(
      (exception) {
        return Left(exception);
      },
      (response) {
        return Right(UserModel.fromJson(response.data));
      },
    );
  }

  Future<bool> forgotPassword(String email, String password) async {
    final response = await networkService.post(
      '/auth/forgetPass',
      data: {'email': email, 'motdepasse': password},
    );

    return response.fold(
      (exception) {
        return false;
      },
      (response) {
        return true;
      },
    );
  }
}
