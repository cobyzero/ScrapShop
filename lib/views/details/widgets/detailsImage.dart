import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

// ignore: must_be_immutable
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
            height: MediaQuery.of(context).size.height * 0.6,
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.grey.shade300,
            ),
          );
        }
      },
    );
  }
}
