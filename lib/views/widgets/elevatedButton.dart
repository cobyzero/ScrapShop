import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatelessWidget {
  MyElevatedButton({
    super.key,
    required this.text,
    required this.icon,
    this.fun,
    this.color = Colors.black87,
  });

  Function()? fun;
  String text;
  IconData icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fun,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 60), backgroundColor: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          space(w: 10),
          Icon(
            icon,
            size: 25,
          )
        ],
      ),
    );
  }
}
