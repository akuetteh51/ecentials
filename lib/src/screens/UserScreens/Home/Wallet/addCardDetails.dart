import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/cardTopup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddCardDetails extends StatelessWidget {
  const AddCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: BackButton(),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
          child: Button(
            text: "Use Card ",
            radius: 10,
            style: TextStyle(color: Colors.white, fontSize: 15),
            onTap: () {
              Get.to(
                () => CardTopup(),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Positioned(child: Image.asset("assets/images/walletcard.png")),
                Positioned(
                  top: 45,
                  right: 45,
                  child: Image.asset("assets/images/chip.png"),
                ),
                Positioned(
                  right: 30,
                  top: 175,
                  child: Image.asset("assets/images/mastercard.png"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 16,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Card Number',
                labelStyle: TextStyle(
                  color: AppColors.primaryBlackColor.withOpacity(.50),
                ),
                hintText: 'Enter Card Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: AppColors.primaryBlackColor.withOpacity(.50),
                ),
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.datetime,
                    maxLength: 5,
                    decoration: InputDecoration(
                      labelText: 'Expires Dates',
                      labelStyle: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.50),
                      ),
                      hintText: '12/08',
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                  flex: 1,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      labelStyle: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.50),
                      ),
                      hintText: '***',
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
