part of 'favorite_cubit.dart';
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetLoadingFavorite extends FavoriteState {}
class GetSuccessFavorite extends FavoriteState {
  final FavoriteModel favoriteModel ;

  GetSuccessFavorite(this.favoriteModel);
}
class GetErrorFavorite extends FavoriteState {}
