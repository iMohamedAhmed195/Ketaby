import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/favorite_feature/presentation/view/widget/favorite_view_body.dart';
import 'package:ketab/features/favorite_feature/presentation/view_model/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<FavoriteCubit>()..getAllFavorite(),
      child: BlocConsumer<FavoriteCubit , FavoriteState>(
        listener: (context , state ){

        },
          builder: (context , state ){
            return Column(
              children: [
                FavoriteViewBody(
                  imageBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().imageFavoriteBook : sl<FavoriteCubit>().imageFavoriteBookAfterDelete,
                  nameBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().nameFavoriteBook : sl<FavoriteCubit>().nameFavoriteBookAfterDelete,
                  categoryBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ?sl<FavoriteCubit>().categoryFavoriteBook : sl<FavoriteCubit>().categoryFavoriteBookAfterDelete,
                  priceBeforeBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().priceAfterFavoriteBook : sl<FavoriteCubit>().priceAfterFavoriteBookAfterDelete,
                  priceAfterBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().priceBeforeFavoriteBook : sl<FavoriteCubit>().priceBeforeFavoriteBookAfterDelete,
                  discountBook:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().discountFavoriteBook : sl<FavoriteCubit>().discountFavoriteBookAfterDelete,
                  length:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().lengthFavoriteBooks : sl<FavoriteCubit>().lengthFavoriteBooksAfterDelete,
                  description:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().description : sl<FavoriteCubit>().descriptionAfterDelete,
                  bookId:sl<FavoriteCubit>().favoriteModel?.dataBook !=null ? sl<FavoriteCubit>().bookId : sl<FavoriteCubit>().bookIdAfterDelete,
                )
              ],
            );
          },

          ) ,
    );
  }
}
