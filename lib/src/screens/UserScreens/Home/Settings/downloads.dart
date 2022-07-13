import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/invoice.dart';
import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  late ScrollController _controller = ScrollController();
  bool showBtn = true;

  void initState() {
    _controller.addListener(() {
      double showOffset = 10.0;
      if (_controller.offset > showOffset) {
        showBtn = true;
        setState(() {});
      } else {
        showBtn = false;
        setState(() {});
      }
    });
    super.initState();
  }

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
      floatingActionButton: AnimatedOpacity(
        duration: Duration(microseconds: 1000),
        opacity: showBtn ? 1.0 : 0.0,
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryBlackColor.withOpacity(.75),
          onPressed: () {
            _controller.animateTo(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
            // _controller.jumpTo(0);
          },
          child: Image.asset("assets/images/cheverot.png"),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 40,
          ),
          child: Column(
            children: List.generate(
              40,
              (index) => Invoice(
                leading: Image.asset("assets/images/invoice.png"),
                title: "Invoice 2567",
                subtitle: "June 5, 2:35",
                trailing: "35.34KB",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
