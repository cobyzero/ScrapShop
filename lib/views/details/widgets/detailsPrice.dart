import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pr;
import 'package:scrap_shop/providers/detailsProvider.dart';
import 'package:scrap_shop/viewModels/cartViewModel.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailsPrice extends StatelessWidget {
  DetailsPrice({super.key, required this.id});
  int id;
  final listProductsViewModel = ListProductsViewModel();
  final listCartViewModel = ListCartViewModel();
  @override
  Widget build(BuildContext context) {
    final provider = pr.Provider.of<DetailsProvider>(context);
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration:
            const BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.grey))),
        child: FutureBuilder(
          future: listProductsViewModel.getProductsForId(id),
          builder: (context, snapshot) {
            if (listProductsViewModel.list != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Text(
                        "\$${listProductsViewModel.list![0].productsModel.price}",
                        style: const TextStyle(fontSize: 23),
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, MediaQuery.of(context).size.height * 0.07),
                          backgroundColor: Colors.black),
                      onPressed: listProductsViewModel.list == null
                          ? null
                          : () {
                              listCartViewModel.setCart(
                                  id,
                                  listProductsViewModel.list![0].productsModel.productSizes['sizes']
                                      [provider.sizeCount],
                                  listProductsViewModel.list![0].productsModel.price!);
                            },
                      icon: const Icon(Icons.local_mall_outlined),
                      label: const Text("Add to Cart"))
                ],
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
