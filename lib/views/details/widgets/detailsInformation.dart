import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

// ignore: must_be_immutable
class DetailsInformation extends StatelessWidget {
  DetailsInformation({super.key, required this.id});
  int id;
  var listProductsViewModel = ListProductsViewModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: FutureBuilder(
        future: listProductsViewModel.getProductsForId(id),
        builder: (context, snapshot) {
          if (listProductsViewModel.list != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listProductsViewModel.list![0].productsModel.title!,
                  style: const TextStyle(fontSize: 24),
                ),
                space(h: 10),
                Text(
                  listProductsViewModel.list![0].productsModel.description!.toLowerCase(),
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
