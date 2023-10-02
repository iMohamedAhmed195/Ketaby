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
    return SingleChildScrollView(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Column(
            children: [
              CarouselImageHome(
                image: sl<HomeCubit>().images,
                index: sl<HomeCubit>().index,
              ),
              BestSellerListView(
                imageBook: sl<HomeCubit>().imageBook,
                nameBook: sl<HomeCubit>().nameBook,
                categoryBook: sl<HomeCubit>().categoryBook,
                priceBeforeBook: sl<HomeCubit>().priceBeforeBook,
                priceAfterBook: sl<HomeCubit>().priceAfterBook,
                discountBook: sl<HomeCubit>().discountBook,
                length: sl<HomeCubit>().lengthBestSeller,
              ),
              CategorySection(
                nameCategory: sl<HomeCubit>().categories,
                lengthCategory: sl<HomeCubit>().lengthCategory,
              ),
              NewArrivalListView(
                imageBook: sl<HomeCubit>().imageBookNewArrival,
                nameBook: sl<HomeCubit>().nameBookNewArrival,
                categoryBook: sl<HomeCubit>().categoryBookNewArrival,
                priceBeforeBook: sl<HomeCubit>().priceBeforeBookNewArrival,
                priceAfterBook: sl<HomeCubit>().priceAfterBookNewArrival,
                discountBook: sl<HomeCubit>().discountBookNewArrival,
                length: sl<HomeCubit>().lengthNewArrival,
              )
            ],
          );
        },
      ),
    );
  }
}
