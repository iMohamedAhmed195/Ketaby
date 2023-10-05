import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/search_feature/data/search_model/get_all_books.dart';
import 'package:ketab/features/search_feature/data/search_model/search_model.dart';

abstract class SearchRepo{
  Future<Either<ServerFailure , GetAllBooksModel>> getAllBooks();
  Future<Either<ServerFailure , SearchModel>> getSearchInBooks(String nameBook);


}