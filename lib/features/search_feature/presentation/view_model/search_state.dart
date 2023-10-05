part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class GetAllBooksLoading extends SearchState {}
class GetAllBooksSuccess extends SearchState {
  final GetAllBooksModel getAllBooksModel;

  GetAllBooksSuccess(this.getAllBooksModel);
}
class GetAllBooksError extends SearchState {}

class SearchBooksLoading extends SearchState {}
class SearchBooksSuccess extends SearchState {
  final SearchModel searchModel;

  SearchBooksSuccess(this.searchModel);
}
class SearchBooksError extends SearchState {}
