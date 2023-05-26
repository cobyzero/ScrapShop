import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/homeProvider.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

// ignore: must_be_immutable
class HomeGridProducts extends StatelessWidget {
  HomeGridProducts({super.key});

  var listProductsViewModel = ListProductsViewModel();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Expanded(
        child: FutureBuilder(
      future: listProductsViewModel.getProducts(provider.homeListCategoryCount),
      builder: (context, snapshot) {
        if (listProductsViewModel.list != null) {
          return GridView.builder(
            itemCount: listProductsViewModel.list!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 230, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return itemGridProducts(listProductsViewModel.list![index], context);
            },
          );
        } else {
          return GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 230, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
              );
            },
          );
        }
      },
    ));
  }

  itemGridProducts(ProductsViewModel productsViewModel, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "details", arguments: productsViewModel.productsModel.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                productsViewModel.productsModel.image!,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              productsViewModel.productsModel.title!,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              "\$${productsViewModel.productsModel.price}",
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
