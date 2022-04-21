import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class ProminentDoctors extends StatelessWidget {
  final String image;
  final String docName;
  final String specialization;
  const ProminentDoctors(
      {Key? key,
      required this.image,
      required this.docName,
      required this.specialization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 150;
    double height = 200;
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                docName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(specialization),
            ),
          ],
        ),
      ),
    );
  }
}
