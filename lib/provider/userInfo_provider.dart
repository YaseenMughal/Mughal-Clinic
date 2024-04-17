import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserInfoProvider extends ChangeNotifier {
  String _userName = '';
  String _userEmail = '';

  String get userName => _userName;
  String get userEmail => _userEmail;

  void setUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  void setUserEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }
}
