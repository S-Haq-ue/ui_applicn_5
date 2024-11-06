import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _checkBoxValue=false;
  int _selectedintex=-1;

  int get selectedintex=>_selectedintex;
  bool get checkBoxValue=>_checkBoxValue;

  set selectedintex(int intex){
    _selectedintex=intex;
    notifyListeners();
  }

  set checkBoxValue(bool value){
    _checkBoxValue=value;
    notifyListeners();
  }

  final tips = [
    "₹20",
    "₹30",
    "₹50",
    "other",
  ];
}
