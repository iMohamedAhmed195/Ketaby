import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/register_feature/data/register_model/failure_register_model.dart';
import 'package:ketab/features/register_feature/data/register_model/register_model.dart';
import 'package:ketab/features/register_feature/data/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {

  RegisterModel? registerModel ;
  FailureRegisterModel? failureRegisterModel;
  @override
  Future<Either<ServerFailure, RegisterModel>> registerInApp(
      {required String name,
        required String email,
        required  String password,
        required String confirmPassword}) async{

    try{
      var result = await sl<DioHelper>().postData(url:ApiConstants.register, data: {
        'name':name,
        'email':email,
        'password':password,
        'password_confirmation':confirmPassword,
      });
      registerModel = RegisterModel.fromJson(result.data);
      return right(registerModel!);
    }catch (error) {
      if (error is DioException) {
        failureRegisterModel = FailureRegisterModel.fromJson(error.response!.data!);
        return left(ServerFailure.fromResponse(error.response!.statusCode, error.response!.data! , 'register'));
      }
      return left(ServerFailure(error.toString()));
    }

  }
}
