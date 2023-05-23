import 'package:flutter/material.dart';

Color colorGray() {
  return const Color(0xffE6E6E6);
}

SizedBox space({double h = 0, double w = 0}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

void messageDialog(BuildContext context, String text) {
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

void loading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Text("Loading..."),
        content: SizedBox(
            height: 20,
            width: 100,
            child: LinearProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            )),
      );
    },
  );
}

void finish(BuildContext context) {
  Navigator.pop(context);
}
