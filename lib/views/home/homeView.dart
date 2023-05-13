import 'package:flutter/material.dart';
import 'package:scrap_shop/views/home/widgets/homeAppBar.dart';
import 'package:scrap_shop/views/home/widgets/homeGridProducts.dart';
import 'package:scrap_shop/views/home/widgets/homeListCategory.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [HomeAppBar(), HomeListCategory(), HomeGridProducts()],
        ),
      ),
    );
  }
}
