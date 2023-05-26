import 'package:flutter/material.dart';

class AppBarFavorites extends StatelessWidget {
  const AppBarFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My Favorites",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
