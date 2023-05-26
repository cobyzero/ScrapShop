import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/views/details/widgets/detailsAppBar.dart';
import 'package:scrap_shop/views/details/widgets/detailsImage.dart';
import 'package:scrap_shop/views/details/widgets/detailsInformation.dart';
import 'package:scrap_shop/views/details/widgets/detailsPrice.dart';
import 'package:scrap_shop/views/details/widgets/detailsSize.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsAppBar(
              id: id,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DetailsImage(
                      id: id,
                    ),
                    DetailsInformation(
                      id: id,
                    ),
                    space(h: 10),
                    DetailsSize(
                      id: id,
                    ),
                  ],
                ),
              ),
            ),
            DetailsPrice(
              id: id,
            )
          ],
        ),
      ),
    );
  }
}
