import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool _loggedIn = false;
  bool isLoggedIn() => _loggedIn;

  void login() async{
    if(_loggedIn) {
      _loggedIn = true;
    }
    notifyListeners();
  }

  void logout() async{
    _loggedIn = false;
    notifyListeners();
  }
}