import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  int _sizeCount = 0;

  int get sizeCount => _sizeCount;

  set sizeCount(int a) {
    _sizeCount = a;
    notifyListeners();
  }

  state() {
    notifyListeners();
  }
}
