import 'package:flutter/material.dart';

class HospitalState extends ChangeNotifier {
  String _nameOfPerson = " Nhana Kwame";

  String get nameOfPerson => _nameOfPerson;

  changeName() {
    _nameOfPerson = "Norbert Aberor";
    notifyListeners();
  }
}

class Nk extends ChangeNotifier {
  
}
