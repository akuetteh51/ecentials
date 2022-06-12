import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:flutter/material.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _heading = [
    "Name",
    "Email",
    "Phone Number",
    "Gender",
    "Address",
    "Occupation",
    "Ghana Card Number",
    "Height",
    "Weight",
  ];
  final _text = [
    "ANDREWS OPOKU",
    "AOPOKU255@GMAIL.COM",
    "+233545098438",
    "MALE",
    "PLT 16 BLK III",
    "MEDICAL DOCTOR",
    "093356147",
    "6.0ft",
    "80 lbs",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: const FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SliverFab(
        floatingWidget: Center(
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(color: AppColors.primaryWhiteColor, width: 5),
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.primaryWhiteColor,
                backgroundImage: const AssetImage(
                  "assets/images/profile.png",
                ),
              ),
            ),
          ),
        ),
        floatingPosition: FloatingPosition(
          right: 0,
          left: 0,
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.2,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.27,
            backgroundColor: AppColors.primaryDeepColor,
            pinned: true,
            floating: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
              ),
            ),
            title: const Text("Edit Profile"),
            centerTitle: true,
            actions: [
              Container(
                child: const Icon(Icons.share),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                top: 70,
              ),
              child: Center(
                child: TextButton(
                  child: Text(
                    "Change Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryBlackColor.withOpacity(.50),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // color: AppColors.primaryRedColor,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                ),
                primary: false,
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) => Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _heading[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryBlackColor.withOpacity(.50),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        initialValue: _text[index],
                        cursorColor: AppColors.primaryDeepColor,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: 60,
                top: 20,
              ),
              child: Button(
                text: "Update",
                style: TextStyle(
                  color: AppColors.primaryWhiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
