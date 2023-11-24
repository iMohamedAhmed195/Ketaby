part of 'favorite_cubit.dart';
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetLoadingFavorite extends FavoriteState {}
class GetSuccessFavorite extends FavoriteState {
  final FavoriteModel favoriteModel ;

  GetSuccessFavorite(this.favoriteModel);
}
class GetErrorFavorite extends FavoriteState {}

class ChangeFavorite extends FavoriteState {}

class RemoveFavoriteLoading extends FavoriteState {}
class RemoveFavoriteSuccess extends FavoriteState {
  final RemoveFavoriteModel removeFavoriteModel;

  RemoveFavoriteSuccess(this.removeFavoriteModel);
}
class RemoveFavoriteError extends FavoriteState {}