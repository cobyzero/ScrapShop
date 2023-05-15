import 'package:flutter/material.dart';

class DetailsPrice extends StatelessWidget {
  const DetailsPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                "PKR 1,190",
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, MediaQuery.of(context).size.height * 0.07),
                  backgroundColor: Colors.black),
              onPressed: () {},
              icon: const Icon(Icons.local_mall_outlined),
              label: const Text("Add to Cart"))
        ],
      ),
    );
  }
}
