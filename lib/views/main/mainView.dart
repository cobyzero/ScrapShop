import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/mainProvider.dart';
import 'package:scrap_shop/views/account/accountView.dart';
import 'package:scrap_shop/views/cart/cartView.dart';
import 'package:scrap_shop/views/favorites/favoritesView.dart';
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
                const FavoritesView(),
                const CartView(),
                const AccountView(),
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
                itemPage("Home", Icons.home_filled, 0, context),
                itemPage("Saved", Icons.favorite_outline, 1, context),
                itemPage("Cart", Icons.shopping_bag_outlined, 2, context),
                itemPage("Settings", Icons.settings_outlined, 3, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconButton itemPage(String title, IconData icon, int id, BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return IconButton(
      onPressed: () {
        pageController.jumpToPage(id);
        provider.pageCount = id;
      },
      icon: Icon(
        icon,
        size: 35,
      ),
      color: provider.pageCount == id ? Colors.black : Colors.grey,
    );
  }
}
