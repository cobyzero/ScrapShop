import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';

class DetailsInformation extends StatelessWidget {
  const DetailsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Regular fit slogan",
            style: TextStyle(fontSize: 24),
          ),
          const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              Text(
                "4.5/5",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "(45 reviews)",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          space(h: 10),
          Text(
            "THE NAME SAYS IT ALL, THE RIGHT SIZE SLIGHTLY SNUGS THE BODY LEAVING ENOUGH ROOM FOR COMFORT IN THE SLEEVES AND WAIST."
                .toLowerCase(),
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
