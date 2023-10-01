import 'package:flutter/material.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/best_seller_list_view.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/carsoul_image_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CarouselImageHome(),
          BestSellerListView(),
        ],
      ),
    );
  }
}
