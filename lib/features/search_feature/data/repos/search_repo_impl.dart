import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/core/network/api_constants.dart';
import 'package:ketab/core/network/dio_helper.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/strings.dart';
import 'package:ketab/features/search_feature/data/repos/search_repo.dart';
import 'package:ketab/features/search_feature/data/search_model/get_all_books.dart';
import 'package:ketab/features/search_feature/data/search_model/search_model.dart';

class SearchRepoImpl extends SearchRepo{
  GetAllBooksModel? getAllBooksModel ;
  SearchModel? searchModel;
  @override
  Future<Either<ServerFailure, GetAllBooksModel>> getAllBooks() async{

      try{
        var result = await sl<DioHelper>().getData(url: ApiConstants.getAllBooks, token: Strings.token);
        getAllBooksModel = GetAllBooksModel.fromJson(result.data);
        return right(getAllBooksModel!);
      }catch (error){
        log(error.toString());
        log('there is an error when you get data in home');
        return left(ServerFailure(error.toString()));
      }
  }

  @override
  Future<Either<ServerFailure, SearchModel>> getSearchInBooks(String nameBook) async{

    try{
      var result = await sl<DioHelper>().getData(url: ApiConstants.searchBooks , token: Strings.token ,query: {
        "name":nameBook
      });
      searchModel = SearchModel.fromJson(result.data);
      return right(searchModel!);
    }catch (error){
      log(error.toString());
      log('there is an error when you get data in home');
      return left(ServerFailure(error.toString()));
    }
  }

}