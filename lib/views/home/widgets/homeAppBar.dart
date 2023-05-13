import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Discover",
            style: TextStyle(fontSize: 32),
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications_outlined,
                size: 40,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
