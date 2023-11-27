import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/best_seller_list_view.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/carsoul_image_home.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/category_section.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/new_arrival_list_view.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    HomeCubit  homeCubit = sl<HomeCubit>();
    return BlocProvider(
      create: (context) => homeCubit..getSliderData()..getNewArrivalData()..getBestSellerData()..getCategoryData(),
      child: SingleChildScrollView(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                CarouselImageHome(
                  image: homeCubit.images,
                  index: homeCubit.index,
                ),
                BestSellerListView(
                  imageBook: homeCubit.imageBook,
                  nameBook: homeCubit.nameBook,
                  categoryBook: homeCubit.categoryBook,
                  priceBeforeBook: homeCubit.priceBeforeBook,
                  priceAfterBook: homeCubit.priceAfterBook,
                  discountBook: homeCubit.discountBook,
                  length: homeCubit.lengthBestSeller,
                  description: homeCubit.description,
                  bookId: homeCubit.bookId,
                ),
                CategorySection(
                  nameCategory: homeCubit.categories,
                  lengthCategory: homeCubit.lengthCategory,
                ),
                NewArrivalListView(
                  imageBook: homeCubit.imageBookNewArrival,
                  nameBook: homeCubit.nameBookNewArrival,
                  categoryBook: homeCubit.categoryBookNewArrival,
                  priceBeforeBook: homeCubit.priceBeforeBookNewArrival,
                  priceAfterBook: homeCubit.priceAfterBookNewArrival,
                  discountBook: homeCubit.discountBookNewArrival,
                  length: homeCubit.lengthNewArrival,
                  description: homeCubit.description,
                  bookId: homeCubit.bookIdArrival,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
