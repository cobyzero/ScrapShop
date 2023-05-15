import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/views/details/widgets/detailsAppBar.dart';
import 'package:scrap_shop/views/details/widgets/detailsInformation.dart';
import 'package:scrap_shop/views/details/widgets/detailsPrice.dart';
import 'package:scrap_shop/views/details/widgets/detailsSize.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/g1.png",
                      width: double.infinity,
                    ),
                    const DetailsInformation(),
                    space(h: 10),
                    const DetailsSize(),
                  ],
                ),
              ),
            ),
            const DetailsPrice()
          ],
        ),
      ),
    );
  }
}
