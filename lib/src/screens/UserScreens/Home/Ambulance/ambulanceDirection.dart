import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulance_map.dart';
import 'package:flutter/material.dart';

class AmbulanceDirection extends StatefulWidget {
  const AmbulanceDirection({Key? key}) : super(key: key);

  @override
  State<AmbulanceDirection> createState() => _AmbulanceDirectionState();
}

class _AmbulanceDirectionState extends State<AmbulanceDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: Text("Zicky Clinical Laboratory"),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 15,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Andrews Opoku",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("10 Mtr Left")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  width: 150,
                  color: AppColors.primaryGreenColor,
                  text: "Start Trip",
                  style: TextStyle(color: AppColors.primaryWhiteColor),
                ),
                Button(
                  width: 150,
                  color: AppColors.primaryRedColor,
                  text: "Cancel",
                  style: TextStyle(color: AppColors.primaryWhiteColor),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: AppColors.primaryRedColor,
      ),
    );
  }
}
