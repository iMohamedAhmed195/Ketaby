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
    CartCubit cartCubit=sl<CartCubit>();
    return BlocProvider(
      create: (context) => cartCubit..getAllCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CartDetailsListView(
                imageBook: cartCubit.getAllCartModel?.data != null? cartCubit.itemProductImage : cartCubit.itemProductImageAfterDelete,
                nameBook:cartCubit.getAllCartModel?.data != null?  cartCubit.itemProductName : cartCubit.itemProductNameAfterDelete,
                priceBeforeBook:cartCubit.getAllCartModel?.data != null?  cartCubit.itemProductPrice:  cartCubit.itemProductPriceAfterDelete ,
                priceAfterBook:cartCubit.getAllCartModel?.data != null?  cartCubit.itemProductPriceAfterDiscount:  cartCubit.itemProductPriceAfterDiscountAfterDelete,
                discountBook:cartCubit.getAllCartModel?.data != null?  cartCubit.itemProductDiscount:  cartCubit.itemProductDiscountAfterDelete,
                length:cartCubit.getAllCartModel?.data != null?  cartCubit.lengthCartBooks:  cartCubit.lengthCartBooksAfterDelete,
                cartCubit: cartCubit,
              ),
              TotalPriceSection(finalPrice:cartCubit.getAllCartModel?.data != null?  cartCubit.totalPrice : cartCubit.totalPriceAfterDelete,),
            ],
          );
        },
      ),
    );
  }
}
