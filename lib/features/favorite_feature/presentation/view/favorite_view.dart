import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/favorite_feature/presentation/view/widget/favorite_view_body.dart';
import 'package:ketab/features/favorite_feature/presentation/view_model/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteCubit favoriteCubit =sl<FavoriteCubit>();
    return BlocProvider(
      create: (BuildContext context) => favoriteCubit..getAllFavorite(),
      child: BlocConsumer<FavoriteCubit , FavoriteState>(
        listener: (context , state ){

        },
          builder: (context , state ){
            return Column(
              children: [
                FavoriteViewBody(
                  imageBook:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.imageFavoriteBook : favoriteCubit.imageFavoriteBookAfterDelete,
                  nameBook:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.nameFavoriteBook : favoriteCubit.nameFavoriteBookAfterDelete,
                  categoryBook:favoriteCubit.favoriteModel?.dataBook !=null ?favoriteCubit.categoryFavoriteBook : favoriteCubit.categoryFavoriteBookAfterDelete,
                  priceBeforeBook:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.priceAfterFavoriteBook : favoriteCubit.priceAfterFavoriteBookAfterDelete,
                  priceAfterBook:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.priceBeforeFavoriteBook : favoriteCubit.priceBeforeFavoriteBookAfterDelete,
                  discountBook:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.discountFavoriteBook : favoriteCubit.discountFavoriteBookAfterDelete,
                  length:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.lengthFavoriteBooks : favoriteCubit.lengthFavoriteBooksAfterDelete,
                  description:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.description : favoriteCubit.descriptionAfterDelete,
                  bookId:favoriteCubit.favoriteModel?.dataBook !=null ? favoriteCubit.bookId : favoriteCubit.bookIdAfterDelete,
                  favoriteCubit: favoriteCubit,
                )
              ],
            );
          },

          ) ,
    );
  }
}
