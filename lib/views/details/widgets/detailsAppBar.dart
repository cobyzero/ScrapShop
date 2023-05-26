import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/favoritesViewModel.dart';

class DetailsAppBar extends StatefulWidget {
  DetailsAppBar({super.key, required this.id});
  int id;

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  final listFavoritesViewModel = ListFavoritesViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            iconSize: 30,
          ),
          const Text(
            "Details",
            style: TextStyle(fontSize: 20),
          ),
          FutureBuilder(
            future: listFavoritesViewModel.getFavoriteForId(widget.id),
            builder: (context, snapshot) {
              if (listFavoritesViewModel.list != null && listFavoritesViewModel.list!.isNotEmpty) {
                return const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                );
              } else {
                return IconButton(
                  onPressed: () {
                    listFavoritesViewModel.setFavorite(widget.id);
                    setState(() {});
                  },
                  icon: const Icon(Icons.favorite_outline),
                  iconSize: 30,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
