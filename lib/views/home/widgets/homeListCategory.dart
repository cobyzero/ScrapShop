import 'package:flutter/material.dart';

class HomeListCategory extends StatelessWidget {
  const HomeListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          itemListCategory("All", true),
          itemListCategory("Men", false),
          itemListCategory("Women", false),
          itemListCategory("Kids", false)
        ],
      ),
    );
  }

  Container itemListCategory(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      alignment: Alignment.center,
      width: 80,
      decoration: BoxDecoration(
          color: active ? Colors.black : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.black, fontSize: 17),
      ),
    );
  }
}
