import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/book_details_feature/data/make_favorite_model/remove_favorite_model.dart';
import 'package:ketab/features/book_details_feature/data/repo/make_favorite_repo.dart';
import 'package:ketab/features/favorite_feature/data/favorite_model/favorite_model.dart';
import 'package:ketab/features/favorite_feature/data/repo/favorite_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit( this.favoriteRepo) : super(FavoriteInitial());

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
  List<int> bookId=[] ;
  List<String> description=[] ;
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
      description.add(favoriteModel!.dataBook!.data![i].description!);
      bookId.add(favoriteModel!.dataBook!.data![i].id!);
    }
    lengthFavoriteBooks = favoriteModel!.dataBook!.data!.length;
  }

   /// remove favorite
  RemoveFavoriteModel? removeFavoriteModel;

  List<String> imageFavoriteBookAfterDelete =[] ;
  List<String> nameFavoriteBookAfterDelete =[] ;
  List<String> categoryFavoriteBookAfterDelete  =[];
  List<String> priceBeforeFavoriteBookAfterDelete  =[];
  List<String> priceAfterFavoriteBookAfterDelete =[] ;
  List<int> bookIdAfterDelete =[] ;
  List<String> descriptionAfterDelete =[] ;
  List<num> discountFavoriteBookAfterDelete  =[];
  int lengthFavoriteBooksAfterDelete  = 0 ;
  getFavoriteAfterDelete (){

    bookIdAfterDelete=[];
    imageFavoriteBookAfterDelete=[];
    nameFavoriteBookAfterDelete=[];
    categoryFavoriteBookAfterDelete=[];
    priceBeforeFavoriteBookAfterDelete=[];
    priceAfterFavoriteBookAfterDelete=[];
    discountFavoriteBookAfterDelete=[];
    descriptionAfterDelete=[];
    lengthFavoriteBooksAfterDelete=0;
    for(int i = 0 ; i < removeFavoriteModel!.data!.dataBook!.length; i++){
      imageFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].image!);
      nameFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].name!);
      categoryFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].category!);
      priceBeforeFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].price!);
      priceAfterFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].price!);
      discountFavoriteBookAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].discount!);
      descriptionAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].description!);
      bookIdAfterDelete.add(removeFavoriteModel!.data!.dataBook![i].id!);
    }

    lengthFavoriteBooksAfterDelete = removeFavoriteModel!.data!.dataBook!.length;
  }


  Future<void> removeFavorite({required int index})async{
    emit(RemoveFavoriteLoading());
    var result;
    if(favoriteModel?.dataBook!=null){
      result = await favoriteRepo.removeFavorite(bookId: bookId[index]);
    }else if(favoriteModel?.dataBook==null){
      result = await favoriteRepo.removeFavorite(bookId: bookIdAfterDelete[index]);
    }
    result.fold(
            (failure) {
          emit(RemoveFavoriteError());
        },
            (removeFavoriteModel) {
              favoriteModel?.dataBook =null;
             this.removeFavoriteModel=removeFavoriteModel;
             getFavoriteAfterDelete();
          emit(RemoveFavoriteSuccess(removeFavoriteModel));
        }
    );
  }
}
