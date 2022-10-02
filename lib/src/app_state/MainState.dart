import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  
  String? _helloTest = "";
  String? get helloTest => _helloTest;

  // This Updated the _helloTest variable
  updateTest( String newValue ) {
    _helloTest = newValue ;
    notifyListeners();
  }
}
