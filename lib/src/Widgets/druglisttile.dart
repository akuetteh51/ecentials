import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrugListTile extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final onTap;
  const DrugListTile(
      {Key? key, this.image, this.title, this.subtitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Image.asset(image!),
          title: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(subtitle!),
        ),
        Divider(
          thickness: 1.5,
          endIndent: 20,
          indent: 20,
        )
      ],
    );
  }
}
