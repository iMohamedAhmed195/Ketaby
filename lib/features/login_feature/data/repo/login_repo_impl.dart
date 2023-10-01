import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/login_feature/data/login_model/failure_login_model.dart';
import 'package:ketab/features/login_feature/data/login_model/login_model.dart';
import 'package:ketab/features/login_feature/data/repo/login_repo.dart';

class LoginRepoImplementation extends LoginRepo {
  LoginModel? loginModel;
  FailureLoginModel? failureLoginModel;
  @override
  Future<Either<ServerFailure, LoginModel>> loginUser(
      String email, String password) async {
    var result = await sl<DioHelper>().postData(url: ApiConstants.logIn, data: {
      'email': email,
      'password': password,
    });
    try {
      loginModel = LoginModel.fromJson(result.data);
      return right(loginModel!);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromResponse(result.statusCode, result.data));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
