import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lang extends StatelessWidget {
  String? country;
  String? language;
  final onTap;
  Lang({Key? key, this.country = "", this.language = "", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(language!),
          subtitle: Text(country!),
        ),
        Divider()
      ],
    );
  }
}
