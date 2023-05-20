import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        itemListItem("assets/p1.png", "Regular fit slogan", "Size L", 1190.02),
        itemListItem("assets/p2.png", "Regular fit Max", "Size M", 2190.02),
        itemListItem("assets/p3.png", "Regular fit Pro", "Size S", 3110.02),
        itemListItem("assets/p4.png", "Regular fit Slow", "Size L", 2140.02),
      ],
    ));
  }

  Container itemListItem(String image, String title, String size, double price) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      width: double.infinity,
      height: 150,
      decoration:
          BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 100,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
                image: DecorationImage(image: AssetImage(image))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    size,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
              Text(
                "PKR $price",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}
