import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _homeListCategoryCount = 0;

  int get homeListCategoryCount => _homeListCategoryCount;

  set homeListCategoryCount(int a) {
    _homeListCategoryCount = a;
    notifyListeners();
  }
}
