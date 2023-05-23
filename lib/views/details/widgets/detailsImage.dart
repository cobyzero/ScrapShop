import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

class DetailsImage extends StatelessWidget {
  DetailsImage({super.key, required this.id});
  int id;
  var listProductsViewModel = ListProductsViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listProductsViewModel.getProductsForId(id),
      builder: (context, snapshot) {
        if (listProductsViewModel.list != null) {
          return Image.network(
            listProductsViewModel.list![0].productsModel.image!,
            width: double.infinity,
          );
        } else {
          return Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.shade300,
          );
        }
      },
    );
  }
}
