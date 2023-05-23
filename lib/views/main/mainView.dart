import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/views/cart/cartView.dart';
import 'package:scrap_shop/views/home/homeView.dart';

class MainView extends StatelessWidget {
  final pageController = PageController(initialPage: 0);

  MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                HomeView(),
                const CartView(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
                color: Colors.white, border: Border(top: BorderSide(color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                itemPage("Home", Icons.home_filled, true, 0),
                itemPage("Saved", Icons.favorite_outline, false, 1),
                itemPage("Cart", Icons.shopping_bag_outlined, false, 2),
                itemPage("Settings", Icons.settings_outlined, false, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconButton itemPage(String title, IconData icon, bool active, int id) {
    return IconButton(
      onPressed: () {
        pageController.jumpToPage(id);
      },
      icon: Icon(
        icon,
        size: 35,
      ),
      color: active ? Colors.black : Colors.grey,
    );
  }
}
