import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/Widgets/prominentDoctors.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

class labScreen extends StatefulWidget {
  const labScreen({Key? key}) : super(key: key);

  @override
  State<labScreen> createState() => _labScreenState();
}

class _labScreenState extends State<labScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/images/hospitallabs.png"),
                ),
                Text(
                  "AnuTech National Hospital",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Row(
                  children: [
                    Text(
                      "3.5km away",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      "Ratings:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "Accra,Ghana",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
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
                      Text(
                        "Hours:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "24H",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
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
                      Text(
                        "Phone:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "+233 xxxxxxxxxxxxx",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonOutlined(
                      text: "Chat",
                      style: TextStyle(color: Colors.white),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 50,
                      hasIcon: true,
                      icon: Icons.message_rounded,
                      iconColor: Colors.white,
                    ),
                    ButtonOutlined(
                      text: "Call",
                      style: TextStyle(color: Colors.white),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 50,
                      hasIcon: true,
                      icon: EcentialsIcons.phone,
                      iconSize: 20,
                      iconColor: Colors.white,
                    ),
                    ButtonOutlined(
                      text: "Call",
                      style: TextStyle(color: Colors.white),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 50,
                      hasIcon: true,
                      icon: EcentialsIcons.phone,
                      iconSize: 20,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
                Text("Prominent doctors"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    children: [
                      ProminentDoctors(
                          image: "assets/images/doctor1.png",
                          docName: "Clara",
                          specialization: "Neuro Surgeon"),
                      ProminentDoctors(
                          image: "assets/images/doctor2.png",
                          docName: "Clara",
                          specialization: "Cardio Surgeon"),
                      ProminentDoctors(
                          image: "assets/images/doctor.png",
                          docName: "Clara",
                          specialization: "Neuro Surgeon"),
                      ProminentDoctors(
                          image: "assets/images/doctor.png",
                          docName: "Clara",
                          specialization: "Computer Surgeon")
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "HealthCare Services",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {
                        print("clicked");
                      },
                      icon: Icon(Icons.compare_arrows_sharp),
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
                      radius: 50,
                    ),
                    ButtonOutlined(
                      text: "Urine Test",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 50,
                    ),
                    ButtonOutlined(
                      text: "DNA test",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 100,
                      height: 40,
                      radius: 50,
                    ),
                  ],
                ),
                SizedBox(
                  child: Card(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print("booked");
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
