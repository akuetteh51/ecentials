// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        // ignore: prefer_const_constructors
        title: Center(
            child: Text(
          "Map View",
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
          markers: {
            // if (_origin != null) _origin,
            // if (_destination != null) _destination
          },
          // onLongPress: _addMarker,
        ),
        // FloatingActionButton(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   foregroundColor: Colors.black,
        //   // onPressed: () {
        //   //   print("object");
        //   // },
        //   onPressed: () => _googleMapController.animateCamera(
        //     CameraUpdate.newCameraPosition(_initialCameraPosition),
        //   ),
        //   child: const Icon(Icons.center_focus_strong),
        // ),

        // Center(
        //   child: SizedBox(
        //     height: 136.3,
        //     width: 346,
        //     child: Card(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(20.0),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 10.0),
        //             child: Image.asset(
        //               "assets/images/avartaamb.png",
        //               height: 118.0,
        //               width: 109.0,
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(0, 0.0, 120.0, 80.0),
        //             child: Text(
        //               "Courier",
        //               style: TextStyle(
        //                 color: const Color(0xFF033A64),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(0, 0.0, 30.0, 80.0),
        //             child: Image.asset(
        //               "assets/images/path2.png",
        //               height: 15.16,
        //               width: 13.33,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ]),
    );
  }

  // void _addMarker(LatLng pos) {
  //   if (_origin == null || (_origin != null && _destination != null)) {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: 'Origin'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //         position: pos,
  //       );
  //     });
  //   } else {
  //     setState(() {
  //       _origin = Marker(
  //         markerId: const MarkerId('destination'),
  //         infoWindow: const InfoWindow(title: 'Destination'),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //         position: pos,
  //       );
  //     });
  //   }
  // }
}
