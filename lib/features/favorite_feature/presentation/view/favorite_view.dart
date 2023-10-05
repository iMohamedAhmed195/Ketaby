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
                  imageBook: sl<FavoriteCubit>().imageFavoriteBook,
                  nameBook: sl<FavoriteCubit>().nameFavoriteBook,
                  categoryBook:sl<FavoriteCubit>().categoryFavoriteBook,
                  priceBeforeBook: sl<FavoriteCubit>().priceAfterFavoriteBook,
                  priceAfterBook: sl<FavoriteCubit>().priceBeforeFavoriteBook,
                  discountBook: sl<FavoriteCubit>().discountFavoriteBook,
                  length: sl<FavoriteCubit>().lengthFavoriteBooks,
                )
              ],
            );
          },

          ) ,
    );
  }
}
