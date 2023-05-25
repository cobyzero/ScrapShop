import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/detailsProvider.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/viewModels/productsViewModel.dart';
import 'package:scrap_shop/views/details/widgets/detailsPrice.dart';

class DetailsSize extends StatelessWidget {
  DetailsSize({super.key, required this.id});

  int id;
  var listProductsViewModel = ListProductsViewModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose size",
            style: TextStyle(fontSize: 24),
          ),
          space(h: 10),
          SizedBox(
              width: double.infinity,
              height: 40,
              child: FutureBuilder(
                future: listProductsViewModel.getProductsForId(id),
                builder: (context, snapshot) {
                  if (listProductsViewModel.list != null) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          listProductsViewModel.list![0].productsModel.productSizes['sizes'].length,
                      itemBuilder: (context, index) {
                        return itemSize(
                            listProductsViewModel.list![0].productsModel.productSizes['sizes']
                                [index],
                            index,
                            context);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              )),
          space(h: 10),
        ],
      ),
    );
  }

  InkWell itemSize(String text, int index, BuildContext context) {
    final provider = Provider.of<DetailsProvider>(context);
    return InkWell(
      onTap: () {
        provider.sizeCount = index;
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: index == provider.sizeCount ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20, color: index == provider.sizeCount ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
