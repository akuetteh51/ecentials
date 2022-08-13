import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/PinCreated.dart';
import 'package:flutter/material.dart';

import '../BASEURL/BASEURL.dart';

class HospitalState extends ChangeNotifier {
  String _nameOfPerson = " Nhana Kwame";

  String get nameOfPerson => _nameOfPerson;

  changeName() {
    _nameOfPerson = "Norbert Aberor";
    notifyListeners();
  }
}

