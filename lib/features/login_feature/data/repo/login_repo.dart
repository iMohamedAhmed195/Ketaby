import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/login_feature/data/login_model/login_model.dart';

abstract class LoginRepo{
  Future<Either<ServerFailure ,LoginModel>> loginUser(String email , String password);
}