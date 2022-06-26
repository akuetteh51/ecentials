import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/invoice.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          title: const Text("Downloads"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              bottom: 40,
            ),
            child: Column(
              children: List.generate(
                10,
                (index) => Invoice(
                  leading: Image.asset("assets/images/invoice.png"),
                  title: "Invoice 2567",
                  subtitle: "June 5, 2:35",
                  trailing: "12.34KB",
                ),
              ),
            ),
          ),
        ));
  }
}
