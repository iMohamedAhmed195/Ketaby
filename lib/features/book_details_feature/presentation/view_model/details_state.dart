part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class ChangeFavorite extends DetailsState {}

class MakeFavoriteLoading extends DetailsState {}
class MakeFavoriteSuccess extends DetailsState {
  final MakeFavoriteModel makeFavoriteModel;

  MakeFavoriteSuccess(this.makeFavoriteModel);
}
class MakeFavoriteError extends DetailsState {}

class RemoveFavoriteLoading extends DetailsState {}
class RemoveFavoriteSuccess extends DetailsState {
  final RemoveFavoriteModel removeFavoriteModel;

  RemoveFavoriteSuccess(this.removeFavoriteModel);
}
class RemoveFavoriteError extends DetailsState {}
