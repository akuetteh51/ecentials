import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapScreen12 extends StatefulWidget {
  const mapScreen12({Key? key}) : super(key: key);

  @override
  State<mapScreen12> createState() => _mapScreen12State();
}

class _mapScreen12State extends State<mapScreen12> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(5.116833, -1.293324),
    zoom: 11.5,
  );
  late GoogleMapController _googleMapController;
  //  Marker _origin;
  // Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Center(
            child: Text(
          "AnuTech National Hospital",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
        ),
        Center(
          child: SizedBox(
            height: 136.3,
            width: 346,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/images/avartaamb.png",
                      height: 118.0,
                      width: 109.0,
                    ),
                  ),
                  Stack(
                    children: [
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            width: 50,
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Image.asset(
                            "assets/images/path2.png",
                            height: 15.16,
                            width: 13.33,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              Text("Elvis Wells"),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.location_pin),
                                  Text("10 Mtr left")
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 290),
            child: Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                      text: "Start Trip",
                      width: 150,
                      color: Colors.green,
                      style: TextStyle(color: Colors.white),
                      radius: 15,
                    ),
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Button(
                    text: "Cancel",
                    width: 150,
                    color: Colors.redAccent,
                    style: TextStyle(color: Colors.white),
                    radius: 15,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
