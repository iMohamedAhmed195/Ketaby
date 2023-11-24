import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/make_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/remove_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/repo/make_favorite_repo.dart';

class MakeAndRemoveFavoriteRepoImpl extends MakeAnDRemoveFavoriteRepo{
  MakeFavoriteModel? makeFavoriteModel;
  RemoveFavoriteModel? removeFavoriteModel;
  @override
  Future<Either<ServerFailure, MakeFavoriteModel>> makeFavorite({required int bookId}) async {
    try{
        print(bookId);
        var result = await sl<DioHelper>().postData(url: ApiConstants.makeFavorite, data: {'product_id': bookId}, token: Strings.token);
        makeFavoriteModel =MakeFavoriteModel.fromJson(result.data);
        return right(makeFavoriteModel!);
    }catch (error){
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, RemoveFavoriteModel>> removeFavorite({required int bookId}) async{
    try{
      print(bookId);
      var result = await sl<DioHelper>().postData(url: ApiConstants.makeFavorite, data: {'product_id': bookId}, token: Strings.token);
      removeFavoriteModel =RemoveFavoriteModel.fromJson(result.data);
      return right(removeFavoriteModel!);
    }catch (error){
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }


}