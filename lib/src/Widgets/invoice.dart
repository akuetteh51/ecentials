import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Invoice extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final String trailing;

  const Invoice({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: leading,
          title: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(subtitle),
          trailing: Text(trailing),
        ),
        const Divider(
          thickness: 2.0,
          endIndent: 15,
          indent: 15,
        ),
      ],
    );
  }
}
