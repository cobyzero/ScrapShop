import 'package:flutter/material.dart';

class HomeGridProducts extends StatelessWidget {
  const HomeGridProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 230, mainAxisSpacing: 20),
        children: [
          itemGridProducts("assets/p1.png", "Regular fit slogan", "PKR 1,190", false, context),
          itemGridProducts("assets/p2.png", "Regular fit slogan", "PKR 1,190", true, context),
          itemGridProducts("assets/p3.png", "Regular fit slogan", "PKR 1,190", false, context),
          itemGridProducts("assets/p4.png", "Regular fit slogan", "PKR 1,190", false, context),
          itemGridProducts("assets/p1.png", "Regular fit slogan", "PKR 1,190", false, context),
          itemGridProducts("assets/p2.png", "Regular fit slogan", "PKR 1,190", false, context),
        ],
      ),
    );
  }

  itemGridProducts(
      String image, String title, String description, bool premium, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "details");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: premium ? Border.all(width: 2, color: Colors.black) : null),
        child: Column(
          children: [
            Image.asset(
              image,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 17),
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
