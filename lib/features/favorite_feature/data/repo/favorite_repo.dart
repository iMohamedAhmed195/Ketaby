import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/favorite_feature/data/favorite_model/favorite_model.dart';

abstract class FavoriteRepo{
  Future<Either<ServerFailure , FavoriteModel>>  getAllFavorite();

  // Future<Either<ServerFailure , FavoriteModel>>  addFavorite();
  //
  // Future<Either<ServerFailure , FavoriteModel>>  removeFavorite();


}