import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';

import 'package:ketab/features/cart_feature/presentation/view/widget/cart_details_list_view.dart';
import 'package:ketab/features/cart_feature/presentation/view/widget/total_price_section.dart';
import 'package:ketab/features/cart_feature/presentation/view_model/cart_cubit.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>()..getAllCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CartDetailsListView(
                imageBook:  sl<CartCubit>().itemProductImage,
                nameBook:  sl<CartCubit>().itemProductName,
                priceBeforeBook:  sl<CartCubit>().itemProductPrice,
                priceAfterBook:  sl<CartCubit>().itemProductPriceAfterDiscount,
                discountBook:  sl<CartCubit>().itemProductDiscount,
                length:  sl<CartCubit>().lengthCartBooks,
              ),
              TotalPriceSection(finalPrice: sl<CartCubit>().totalPrice,),
            ],
          );
        },
      ),
    );
  }
}
