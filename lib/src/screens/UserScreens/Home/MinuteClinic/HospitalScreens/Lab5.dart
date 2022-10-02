import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/Widgets/prominentDoctors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital4Chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app_state/hospital_state.dart';
import '../../../../../app_state/user_state.dart';
import '../../Ambulance/ambulanceRouting.dart';
import 'docotorInfo.dart';
import 'hospitalSchedules.dart';

class LabScreen extends StatefulWidget {
  final Map? data;

  const LabScreen({Key? key, this.data}) : super(key: key);

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  @override
  Widget build(BuildContext context) {
    HospitalState TopDoctorState =
        Provider.of<HospitalState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Image(
                  image: NetworkImage(widget.data!['images'][2]),
                  height:350 ,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 8,
                 
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 26,horizontal: 10),
        
                  child: Text(
                   " ${widget.data!["name"]}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         
                        Text(
                          " 2km",
                          style: TextStyle(fontSize: 17),
                        ),
                       
                        Expanded(
                          child: Row(
                            children: [
                        Text(
                          "Ratings: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: AppColors.primaryOrangeColor,
                              ),Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.primaryOrangeColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.primaryOrangeColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.primaryOrangeColor,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.primaryOrangeColor,
                          ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                  child: Row(
                    children: [
                      Text(
                        "Address: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                  Expanded(
                    child: Text(
                          "${widget.data!["address"]}",
                          style: TextStyle(fontSize: 17),
                        ),
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 2),
                  child: Row(
                    children: [
                       
                      Text(
                        "Hours: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Expanded(
                        child: Text(
                          "${widget.data!["opening_hours"]}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 56),
                        child: Text(
                          "Phone: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${widget.data!["phone_number"]}",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                          left: 14,
                          right: 14,
                        ),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 12),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => chat4(),
                          ),
                        );
                      },
                      child: Row(children: [
                        Icon(Icons.message_outlined),
                        Text(" Chat")
                      ]),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                          left: 14,
                          right: 14,
                        ),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => chat4()));
                      },
                      child: Row(children: [
                        Icon(Icons.phone_in_talk),
                        Text("  Call"),
                      ]),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                          left: 14,
                          right: 14,
                        ),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AmbulanceRoutingScreen()));
                      },
                      child: Row(children: [
                        Icon(Icons.directions),
                        Text("Direction"),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "Prominent doctors",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
                future: TopDoctorState.TopDoctor(
                  token: userState.userInfo?['token'],
                ),
                builder: (context, AsyncSnapshot TopDoctorState) {
                  if (TopDoctorState.hasData) {
                    List topDoctor = TopDoctorState.data;
                    if (topDoctor.isNotEmpty) {
                      return Row(
                        children: List.generate(
                          topDoctor.length,
                          (index) => ProminentDoctors(
                            image: topDoctor[index]["image"],
                            docName: topDoctor[index]["name"],
                            specialization:  topDoctor[index]["area"],
                        )
                        ),
                      );
                    }
                    return Container(height: 105,width: 150,color: Colors.white60,child: Center(child: Text("No Data found")));
                  }
                  return CircularProgressIndicator();
                }),
          ),

                Row(
                  children: [
                    Text(
                      "HealthCare Services",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(
                      height: 29,
                      width: 140,
                    ),
                    IconButton(
                      onPressed: () {
                        print("clicked");
                      },
                      icon: Icon(
                        Icons.compare_arrows_sharp,
                        color: const Color(0xFF033A64),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonOutlined(
                      text: "Blood Test",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 8,
                    ),
                    ButtonOutlined(
                      text: "Urine Test",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 8,
                    ),
                    ButtonOutlined(
                      text: "DNA test",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 8,
                    ),
                  ],
                ),
                SizedBox(
                  child: Card(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 80, right: 80, top: 15, bottom: 15),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Schedule()));
                      },
                      child: Text("Book Session"),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
