import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/favorite_feature/data/favorite_model/favorite_model.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo{
  FavoriteModel? favoriteModel ;
  @override
  Future<Either<ServerFailure, FavoriteModel>> getAllFavorite() async{

    try{
      var result= await sl<DioHelper>().getData(url:ApiConstants.getFavorite, token: Strings.token);
      favoriteModel = FavoriteModel.fromJson(result.data);

      return right(favoriteModel!);
    }catch (error){
      log(error.toString());
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }
}