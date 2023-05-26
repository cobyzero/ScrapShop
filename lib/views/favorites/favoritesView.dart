import 'package:flutter/material.dart';
import 'package:scrap_shop/views/favorites/widgets/appbarFavorites.dart';
import 'package:scrap_shop/views/favorites/widgets/gridlistFavorites.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [AppBarFavorites(), GridListFavorites()],
      ),
    );
  }
}
