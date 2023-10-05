import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/favorite_feature/data/favorite_model/favorite_model.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);
 final FavoriteRepo favoriteRepo;

  /* get all Favorite*/

  FavoriteModel? favoriteModel;
  Future<void> getAllFavorite() async {
    emit(GetLoadingFavorite());

    var result = await favoriteRepo.getAllFavorite();


    result.fold((failure) {
      emit(GetErrorFavorite());
    }, (favoriteModel) {
      this.favoriteModel =favoriteModel ;
      getFavorite();
      emit(GetSuccessFavorite(favoriteModel));
    });
  }
  List<String> imageFavoriteBook =[] ;
  List<String> nameFavoriteBook=[] ;
  List<String> categoryFavoriteBook =[];
  List<String> priceBeforeFavoriteBook =[];
  List<String> priceAfterFavoriteBook=[] ;
  List<num> discountFavoriteBook =[];
  int lengthFavoriteBooks = 0 ;
  getFavorite(){
    for(int i = 0 ; i < favoriteModel!.dataBook!.data!.length ; i++){
      imageFavoriteBook.add(favoriteModel!.dataBook!.data![i].image!);
      nameFavoriteBook.add(favoriteModel!.dataBook!.data![i].name!);
      categoryFavoriteBook.add(favoriteModel!.dataBook!.data![i].category!);
      priceBeforeFavoriteBook.add(favoriteModel!.dataBook!.data![i].price!);
      priceAfterFavoriteBook.add(favoriteModel!.dataBook!.data![i].price!);
      discountFavoriteBook.add(favoriteModel!.dataBook!.data![i].discount!);
    }
    lengthFavoriteBooks = favoriteModel!.dataBook!.data!.length;
  }


}
