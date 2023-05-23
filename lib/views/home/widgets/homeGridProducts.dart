import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

class HomeGridProducts extends StatefulWidget {
  const HomeGridProducts({super.key});

  @override
  State<HomeGridProducts> createState() => _HomeGridProductsState();
}

class _HomeGridProductsState extends State<HomeGridProducts> {
  var listProductsViewModel = ListProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: listProductsViewModel.getProducts(),
      builder: (context, snapshot) {
        if (listProductsViewModel.list != null) {
          return GridView.builder(
            itemCount: listProductsViewModel.list!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 230, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return itemGridProducts(listProductsViewModel.list![index]);
            },
          );
        } else {
          return GridView.builder(
            itemCount: listProductsViewModel.list!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 230, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              );
            },
          );
        }
      },
    ));
  }

  itemGridProducts(ProductsViewModel productsViewModel) {
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
              "S/.${productsViewModel.productsModel.price}",
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
