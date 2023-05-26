import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/favoritesViewModel.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GridListFavorites extends StatefulWidget {
  GridListFavorites({super.key});

  @override
  State<GridListFavorites> createState() => _GridListFavoritesState();
}

class _GridListFavoritesState extends State<GridListFavorites> {
  final listFavoritesViewModel = ListFavoritesViewModel();
  final listProductsViewModel = ListProductsViewModel();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: listFavoritesViewModel.getFavorites(),
      builder: (context, snapshot) {
        if (listFavoritesViewModel.list != null) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: listFavoritesViewModel.list!.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: listProductsViewModel.getProductsForId(
                    listFavoritesViewModel.list![index].favoritesModel.productId!),
                builder: (context, snapshot) {
                  if (listProductsViewModel.list != null) {
                    return itemList(
                        listProductsViewModel.list![0].productsModel.image!,
                        listProductsViewModel.list![0].productsModel.price!,
                        listProductsViewModel.list![0].productsModel.title!,
                        listFavoritesViewModel.list![index].favoritesModel.id!);
                  } else {
                    return Container();
                  }
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    ));
  }

  Container itemList(String image, double price, String title, int id) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(image)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$$price",
                style: const TextStyle(color: Colors.grey),
              ),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    listFavoritesViewModel.deleteFavorite(id);
                    setState(() {});
                  },
                  icon: const Icon(
                    color: Colors.red,
                    Icons.favorite,
                    size: 17,
                  ))
            ],
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
