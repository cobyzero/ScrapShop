import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/detailsProvider.dart';
import 'package:scrap_shop/viewModels/cartViewModel.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';

class CartListItem extends StatefulWidget {
  CartListItem({super.key});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  var listCartViewModel = ListCartViewModel();

  var listProductsViewModel = ListProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
      future: listCartViewModel.getCart(),
      builder: (context, snapshot) {
        if (listCartViewModel.list != null) {
          return ListView.builder(
            itemCount: listCartViewModel.list!.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: listProductsViewModel
                    .getProductsForId(listCartViewModel.list![index].cartModel.productId!),
                builder: (context, snapshot) {
                  if (listProductsViewModel.list != null) {
                    return itemListItem(
                        listProductsViewModel.list![0].productsModel.image!,
                        listProductsViewModel.list![0].productsModel.title!,
                        listCartViewModel.list![index].cartModel.size!,
                        listCartViewModel.list![index].cartModel.price!,
                        listCartViewModel.list![index].cartModel.id!);
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

  InkWell itemListItem(String image, String title, String size, double price, int id) {
    final provider = Provider.of<DetailsProvider>(context);
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.red,
      onLongPress: () {
        listCartViewModel.deleteCart(id);
        provider.state();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        width: double.infinity,
        height: 150,
        decoration:
            BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 100,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey),
                    image: DecorationImage(image: NetworkImage(image))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Size $size",
                        style: const TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  ),
                  Text(
                    "\$$price",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
