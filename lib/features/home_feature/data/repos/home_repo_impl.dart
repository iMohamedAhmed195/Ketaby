import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/home_feature/data/home_model/best_seller_model.dart';
import 'package:ketab/features/home_feature/data/home_model/category_model.dart';
import 'package:ketab/features/home_feature/data/home_model/new_arrival_model.dart';
import 'package:ketab/features/home_feature/data/home_model/slider_model.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo{

  SliderModel? sliderModel;
  BestSellerModel? bestSellerModel;
  CategoryModel? categoryModel;
  NewArrivalModel? newArrivalModel;
  @override
  Future<Either<ServerFailure, SliderModel>> getSliderData() async{
    try {
      var result = await sl<DioHelper>().getData(
          url:ApiConstants.sliderData,
          token: Strings.token
      );

      sliderModel = SliderModel.fromJson(result.data);
      return right(sliderModel!);

    }  catch (error) {
       log('there is an error when you get data in home');
       return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, BestSellerModel>> getBestSellerData() async{
    try {
      var result = await sl<DioHelper>().getData(
          url:ApiConstants.bestSellerData,
          token: Strings.token
      );

      bestSellerModel = BestSellerModel.fromJson(result.data);
      return right(bestSellerModel!);

    }  catch (error) {
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, CategoryModel>> getCategoryData() async{
    try {
      var result = await sl<DioHelper>().getData(
          url:ApiConstants.categoryData,
          token: Strings.token
      );
      categoryModel = CategoryModel.fromJson(result.data);
      return right(categoryModel!);

    }  catch (error) {
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, NewArrivalModel>> getNewArrivalData() async{
    try {
      var result = await sl<DioHelper>().getData(
          url:ApiConstants.newArrivalData,
          token: Strings.token
      );
      newArrivalModel = NewArrivalModel.fromJson(result.data);
      return right(newArrivalModel!);

    }  catch (error) {
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

}