import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/cart_feature/data/cart_model/delete_item_from_cart.dart';
import 'package:ketab/features/cart_feature/data/cart_model/get_cart_data_model.dart';
import 'package:ketab/features/cart_feature/data/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo{
  GetAllCartModel? getAllCartModel ;
  DeleteItemCartModel? deleteItemCartModel;
  @override
  Future<Either<ServerFailure, GetAllCartModel>> getAllCart() async{
    try{
      var result =await  sl<DioHelper>().getData(url: ApiConstants.getCart , token: Strings.token);
      getAllCartModel = GetAllCartModel.fromJson(result.data);

      return right(getAllCartModel!) ;
    }catch (error){
      log(error.toString());
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, DeleteItemCartModel>> deleteItemFromCart(int bookId) async{
    try{
      var result =await  sl<DioHelper>().postData(url: ApiConstants.deleteFromCart ,data: {
       "cart_item_id" : bookId
      }, token: Strings.token);
      deleteItemCartModel = DeleteItemCartModel.fromJson(result.data);

      return right(deleteItemCartModel!) ;
    }catch (error){
      log(error.toString());
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

}