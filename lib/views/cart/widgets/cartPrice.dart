import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/detailsProvider.dart';
import 'package:scrap_shop/util/const.dart';
import 'package:scrap_shop/viewModels/cartViewModel.dart';

class CartPrice extends StatelessWidget {
  CartPrice({super.key});
  var listCartViewModel = ListCartViewModel();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailsProvider>(context);

    return FutureBuilder(
      future: listCartViewModel.getCart(),
      builder: (context, snapshot) {
        if (listCartViewModel.list != null) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sub-total",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "\$ ${getSubTotal()}",
                    style: const TextStyle(fontSize: 24),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "IGV($IGV%)",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "\$ ${getIGV(getSubTotal())}",
                    style: const TextStyle(fontSize: 24),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "\$ ${getTotal(getSubTotal(), getIGV(getSubTotal()))}",
                    style: const TextStyle(fontSize: 24),
                  )
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  double getSubTotal() {
    double subTotal = 0;
    for (var element in listCartViewModel.list!) {
      subTotal += double.parse(element.cartModel.price!.toStringAsFixed(2));
    }

    return subTotal;
  }

  double getIGV(double subTotal) {
    return double.parse((subTotal * (IGV / 100)).toStringAsFixed(2));
  }

  double getTotal(double subTotal, double igv) {
    return double.parse((subTotal + igv).toStringAsFixed(2));
  }
}
