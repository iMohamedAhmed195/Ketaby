import 'package:flutter/material.dart';

import 'package:ketab/features/cart_feature/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartViewBody()
      ],
    );
  }
}
