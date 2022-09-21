import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ShowToast {
 static void ecentialsToast({String message = "",bool warn = true, bool long =false}) {
    Toast.show(
            message,
            duration: long == true ? Toast.lengthLong : Toast.lengthShort,
           
            gravity: Toast.bottom,
            backgroundColor: warn == true? Colors.redAccent : Color.fromARGB(255, 1, 198, 50),
          );
  }
}
