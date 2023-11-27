import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/profile_feature/data/profile_model/profile_model.dart';
import 'package:ketab/features/profile_feature/data/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo{
  ProfileModel? profileModel;
  @override
  Future<Either<ServerFailure, ProfileModel>> getDataProfile() async{
        try{
          var result = await sl<DioHelper>().getData(url: ApiConstants.getProfile , token: Strings.token);
          profileModel =ProfileModel.fromJson(result.data) ;
          return right(profileModel!);
        }catch(error){
          log('there is an error when you get data in home');
          return left(ServerFailure(error.toString()));
        }
  }


  @override
  Future<Either<ServerFailure, ProfileModel>> editDataProfile(
      {String? name, String? phone, String? city, String? address}) async{
    try{
      var result = await sl<DioHelper>().postData(url: ApiConstants.updateProfile ,data:{
        'name' : name,
         'phone' : phone,
        'city' : city,
        'address' : address
      } ,  token: Strings.token);
      profileModel =ProfileModel.fromJson(result.data) ;
      return right(profileModel!);
    }catch(error){
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }


  
}