import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pr;
import 'package:scrap_shop/providers/homeProvider.dart';
import 'package:scrap_shop/viewModels/categoryViewModel.dart';

class HomeListCategory extends StatelessWidget {
  HomeListCategory({super.key});
  var listCategoryViewModel = ListCategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 40,
        child: FutureBuilder(
          future: listCategoryViewModel.getCategory(),
          builder: (context, snapshot) {
            if (listCategoryViewModel.list != null) {
              return ListView.builder(
                itemCount: listCategoryViewModel.list!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return itemListCategory(
                      listCategoryViewModel.list![index].categoryModel.name!, index, context);
                },
              );
            } else {
              return ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return itemListCategory("", 20, context);
                },
              );
            }
          },
        ));
  }

  InkWell itemListCategory(String text, int index, BuildContext context) {
    final provider = pr.Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: () {
        provider.homeListCategoryCount = index;
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
            color: index == provider.homeListCategoryCount ? Colors.black : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              color: index == provider.homeListCategoryCount ? Colors.white : Colors.black,
              fontSize: 17),
        ),
      ),
    );
  }
}
