import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/load.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({Key? key}) : super(key: key);

  @override
  State<SendRequest> createState() => _SendRequestState();
}

class _SendRequestState extends State<SendRequest> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
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
                height: 40,
              ),
              Text(
                "Amount",
                style: TextStyle(
                  color: AppColors.primaryBlackColor.withOpacity(.70),
                ),
              ),
              SizedBox(
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
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 20),
                  cursorColor: AppColors.primaryDeepColor,
                  decoration: const InputDecoration(
                    hintText: "0.00",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("CARD"),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (_) {},
                    activeColor: AppColors.primaryDeepColor,
                  ),
                  Flexible(
                    child: Container(
                      width: double.maxFinite,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("assets/images/card_holder.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mater Card",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primaryBlackColor
                                              .withOpacity(.70)),
                                    ),
                                    Text(
                                      "Andrews Opoku Senior Antwi",
                                      style: TextStyle(),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("**** **** **** 8869"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Button(
                  radius: 10,
                  text: "Send a request",
                  width: 250,
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                  ),
                  onTap: () {
                    Get.to(() => Load());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
