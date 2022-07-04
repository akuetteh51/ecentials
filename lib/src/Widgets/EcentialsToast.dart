import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ShowToast {
 static void ecentialsToast({String message = "",bool warn = true}) {
    Toast.show(
            message,
            duration: Toast.lengthShort,
            gravity: Toast.bottom,
            backgroundColor: warn == true? Colors.redAccent :const Color.fromARGB(255, 16, 242, 72),
          );
  }
}
