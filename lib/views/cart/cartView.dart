import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/views/cart/widgets/cartAppBar.dart';
import 'package:scrap_shop/views/cart/widgets/cartListItem.dart';
import 'package:scrap_shop/views/cart/widgets/cartPrice.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CartAppBar(),
            CartListItem(),
            CartPrice(),
          ],
        ),
      ),
    );
  }
}
