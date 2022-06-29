import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StoreCard extends StatefulWidget {
  final onTap;
  final String image;
  final String text;
  const StoreCard(
      {Key? key, this.onTap, required this.image, required this.text})
      : super(key: key);

  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(widget.image),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
