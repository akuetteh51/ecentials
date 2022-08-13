import 'package:flutter/material.dart';

class AvailableDrugsCard extends StatelessWidget {
  final onTap;
  const AvailableDrugsCard({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(
            top: 15.34,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Ibuprofen",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 106,
                    margin: EdgeInsets.only(
                      left: 18.42,
                    ),
                    child: Text(
                      "Tablets *5 pieces",
                      style: TextStyle(
                          color: const Color(0xFF979797),
                          fontSize: 12,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Text(
                "\$5.00",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF033A64),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}
