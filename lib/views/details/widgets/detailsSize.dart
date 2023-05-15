import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';

class DetailsSize extends StatelessWidget {
  const DetailsSize({super.key});

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
            child: ListView(scrollDirection: Axis.horizontal, children: [
              itemSize("S"),
              itemSize("M"),
              itemSize("L"),
            ]),
          ),
          space(h: 10),
        ],
      ),
    );
  }

  Container itemSize(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
