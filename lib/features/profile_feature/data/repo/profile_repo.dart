import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/profile_feature/data/profile_model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<ServerFailure, ProfileModel>> getDataProfile();
  Future<Either<ServerFailure, ProfileModel>> editDataProfile({
    String name,
    String phone,
    String city,
    String address,
  });
}
