import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../Themes/colors.dart';
import '../../../../Widgets/button.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    final _text = {
      "Resident ID": "#234566",
      "Name": "Andrews Opoku",
      "Email": "aopoku255@gmail.com",
      "Amount": "GHC 400",
    };
    // TextField

    _textField({String? label, String? hint}) => Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label!,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Neumorphic(
              padding: const EdgeInsets.only(
                left: 10,
                right: 20,
              ),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 0,
                color: Colors.grey.withOpacity(.10),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(fontSize: 20),
                cursorColor: AppColors.primaryDeepColor,
                decoration: InputDecoration(
                  hintText: hint,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.asset("assets/images/walletcard.png"),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 90,
                      child: Column(
                        children: [
                          Text(
                            "Balance",
                            style:
                                TextStyle(color: AppColors.primaryWhiteColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "GHC 200.00",
                            style: TextStyle(
                              color: AppColors.primaryWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: List.generate(
                          4,
                          (index) => _textField(
                            hint: _text.values.elementAt(index),
                            label: _text.keys.elementAt(index),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Button(
                        text: "Confirm",
                        width: 200,
                        radius: 10,
                        style: TextStyle(
                          color: AppColors.primaryWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
