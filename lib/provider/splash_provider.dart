import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SplashProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(int newIndex) {
    _currentPage = newIndex;
    notifyListeners();
  }
}
