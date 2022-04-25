import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class SchoolsAttendedCard extends StatelessWidget {
  final String schoolName;
  final String program;
  final String year;
  final double height;
  final double? width;
  const SchoolsAttendedCard(
      {Key? key,
      required this.schoolName,
      required this.program,
      required this.year,
      this.height = 180,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 170,
      width: width,
      child: Card(
          elevation: 10,
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schoolName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDeepColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    program,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                ),
                Text(
                  year,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(EcentialsIcons.text_pen,
                                color: Color(0xFF033A64)),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              EcentialsIcons.bin,
                              color: Color(0xFF033A64),
                            ),
                          ),
                        ],
                      )
                    ]),
              ],
            ),
          )),
    );
  }
}
