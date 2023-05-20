import 'package:flutter/material.dart';

colorGray() {
  return const Color(0xffE6E6E6);
}

space({double h = 0, double w = 0}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

messageDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Information"),
        content: Text(text),
      );
    },
  );
}
