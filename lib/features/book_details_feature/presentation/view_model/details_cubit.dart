import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/make_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/remove_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/repo/make_favorite_repo.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.makeAnRemoveFavoriteRepo) : super(DetailsInitial());

  static DetailsCubit get(context) => BlocProvider.of(context);

  bool isFavorite = false ;

  changeFavorite(bool click){
    print(isFavorite);
    if(click == true){
      isFavorite =  false;
      emit(ChangeFavorite());
    }else if (click == false){
      isFavorite = true;
      emit(ChangeFavorite());
    }

  }

  /*Make favorite*/
  final MakeAnDRemoveFavoriteRepo makeAnRemoveFavoriteRepo ;
  MakeFavoriteModel? makeFavoriteModel;
  Future<void> makeFavorite({required int bookId})async{
    emit(MakeFavoriteLoading());
    var result = await makeAnRemoveFavoriteRepo.makeFavorite(bookId: bookId);

    result.fold(
            (failure) {
              emit(MakeFavoriteError());
            },
            (makeFavoriteModel) {
              this.makeFavoriteModel=makeFavoriteModel;
              emit(MakeFavoriteSuccess(makeFavoriteModel));
            }
    );
  }


 /* remove favorite */
  RemoveFavoriteModel? removeFavoriteModel;
  Future<void> removeFavorite({required int bookId})async{
    emit(RemoveFavoriteLoading());
    var result = await makeAnRemoveFavoriteRepo.removeFavorite(bookId: bookId);

    result.fold(
            (failure) {
              emit(RemoveFavoriteError());
            },
            (removeFavoriteModel) {
              this.removeFavoriteModel=removeFavoriteModel;
              emit(RemoveFavoriteSuccess(removeFavoriteModel));
            }
    );
  }



}
