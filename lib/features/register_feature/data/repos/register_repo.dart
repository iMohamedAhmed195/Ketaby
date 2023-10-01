import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/register_feature/data/register_model/register_model.dart';

abstract class RegisterRepo{
  Future<Either<ServerFailure , RegisterModel>> registerInApp(
      {required String name,required String email,required String password,required String confirmPassword});
}