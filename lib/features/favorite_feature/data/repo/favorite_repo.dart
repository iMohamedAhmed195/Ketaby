import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/remove_favorite_model.dart';
import 'package:ketab/features/favorite_feature/data/favorite_model/favorite_model.dart';

abstract class FavoriteRepo{
  Future<Either<ServerFailure , FavoriteModel>>  getAllFavorite();

  Future<Either<ServerFailure , RemoveFavoriteModel>> removeFavorite({required int bookId});


}