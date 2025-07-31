import 'package:flutter/material.dart';

class UserRegistrationProvider with ChangeNotifier {
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;

  void setName(String name){
    _name = name;
    notifyListeners();
  }
  void setEmail(String email){
    _email = email;
    notifyListeners();
  }
}