import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int _pageCount = 0;

  int get pageCount => _pageCount;

  set pageCount(int a) {
    _pageCount = a;
    notifyListeners();
  }
}
