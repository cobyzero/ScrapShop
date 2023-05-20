import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/views/cart/widgets/cartAppBar.dart';
import 'package:scrap_shop/views/cart/widgets/cartListItem.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CartAppBar(),
            CartListItem(),
            space(h: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub-total",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "PKR 5,870",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "IGV(%)",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "PKR 0,0",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "PKR 5,870",
                  style: TextStyle(fontSize: 24),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
