import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/make_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/remove_favorite_model.dart';

abstract class MakeAnDRemoveFavoriteRepo{
  Future<Either<ServerFailure , MakeFavoriteModel>> makeFavorite({required int bookId});
  Future<Either<ServerFailure , RemoveFavoriteModel>> removeFavorite({required int bookId});
}