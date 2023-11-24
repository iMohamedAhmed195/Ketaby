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
                imageBook: sl<CartCubit>().getAllCartModel?.data != null? sl<CartCubit>().itemProductImage : sl<CartCubit>().itemProductImageAfterDelete,
                nameBook:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().itemProductName : sl<CartCubit>().itemProductNameAfterDelete,
                priceBeforeBook:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().itemProductPrice:  sl<CartCubit>().itemProductPriceAfterDelete ,
                priceAfterBook:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().itemProductPriceAfterDiscount:  sl<CartCubit>().itemProductPriceAfterDiscountAfterDelete,
                discountBook:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().itemProductDiscount:  sl<CartCubit>().itemProductDiscountAfterDelete,
                length:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().lengthCartBooks:  sl<CartCubit>().lengthCartBooksAfterDelete,
              ),
              TotalPriceSection(finalPrice:sl<CartCubit>().getAllCartModel?.data != null?  sl<CartCubit>().totalPrice : sl<CartCubit>().totalPriceAfterDelete,),
            ],
          );
        },
      ),
    );
  }
}
