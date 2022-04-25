import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/ambulanceResultsList.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/pickUpLocation.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';

import 'package:ecentialsclone/src/Widgets/prominentDoctors.dart';
import 'package:ecentialsclone/src/Widgets/recentChatsCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';

import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/cartCard.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';

import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';

import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:ecentialsclone/src/Widgets/storeList.dart';
import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),

            //AMBULANCE RESULTS
            const Text(
              "Ambulance Results",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const ambulanceResultsList(
                type: "Mid-level",
                discount: 10,
                prize: 32,
                description: "with Oxygen, extra 2 sets with stretcher"),
            //AMBULANCE RESULTS

            const SizedBox(
              height: 50,
            ),
            //BUTTON 1
            const Text(
              "Orange Button",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              width: 300,
              child: Button(
                  text: "Confirm",
                  color: AppColors.primaryRedColor,
                  style: TextStyle(
                      fontSize: 16, color: AppColors.primaryWhiteColor)),
            ),
            //BUTTON-1
            const SizedBox(
              height: 50,
            ),
            //BUTTON-2
            const Text(
              "Blue Button",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              width: 300,
              child: Button(
                  text: "Confirm",
                  style: TextStyle(
                      fontSize: 16, color: AppColors.primaryWhiteColor)),
            ),
            //BUTTO2
            const SizedBox(
              height: 50,
            ),
            //CART CARD
            const Text(
              "Cart Item",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const cartCard(
              //TODO: change mic icon to delete
              pharmacyName: "Top up pharmacy",
              location: "Spintex",
              drugName: "Ibuprofen",
              price: 24.50,
            ),
            //CART CARD
            const SizedBox(
              height: 50,
            ),
            //DOCTOR CARD
            const Text(
              "Doctor Name Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const doctorCard(
                fname: "Jesse",
                lname: "Anim",
                role: "Doctor",
                hospital: "Hospital"),
            //DOCTOR CARD
            const SizedBox(
              height: 50,
            ),
            //DRUG CARD
            const Text(
              "Drug Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const drugCard(
                drugName: "Ibuprofen",
                drugType: "Tablets",
                quantity: 50,
                price: 5.0),
            //DRUG CARD
            const SizedBox(
              height: 50,
            ),
            //INFORMATION CARD
            const Text(
              "Information Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const InfoCard(
              topText: "PERSONAL",
              bottomText: "INFORMATION",
              showlock: true,
            ),
            //INFORMATION CARD
            const SizedBox(
              height: 50,
            ),
            //LAB RESULTS
            const Text(
              "Lab Results Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const LabResultsCard(
              image: "assets/images/card-1.png",
              labName: "Ziky Clinical Laboratory",
              openingHours: "7:00 - 18:00",
              service1: "Research",
              service2: "Tests",
              service3: "Examination",
              price: "12.0",
            ),
            //LAB RESULTS
            const SizedBox(
              height: 50,
            ),
            //OUTLINED BUTTON
            const Text(
              "Outlined Button",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
                width: 300,
                child: ButtonOutlined(
                  text: "Track Delivery",
                  style: TextStyle(color: AppColors.primaryDeepColor),
                )),
            //OUTLINED BUTTON
            const SizedBox(
              height: 50,
            ),
            //PHARMACY
            const Text(
              "Pharmacy Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const PharmacyCard(
                //TODO: change mic icon to heart
                pharmacyName: "Top up pharmacy",
                location: "Spintex",
                address: "Accra",
                country: "Ghana"),
            //PHARMACY
            const SizedBox(
              height: 50,
            ),
            //PICKUP LOCATION
            const Text(
              "Pickup Location Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const pickupLocationCard(
              title: "Pick-up Location",
              location: "Spintex",
              address: "Accra",
              country: "Ghana",
            ),
            //PICKUP LOCATION
            const SizedBox(
              height: 50,
            ),
            //PROMINENT DOCTORS
            const Text(
              "Prominent Doctors Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const ProminentDoctors(
                image: "assets/images/doctor.png",
                docName: "Dr.George",
                specialization: "Neuro Surgeon"),
            //PROMINENT DOCTORS
            const SizedBox(
              height: 50,
            ),
            //RECENT CHAT CARD
            const Text(
              "Recent Chat Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const RecentChatsCard(
                image: "assets/images/profile_image.png",
                docName: "Dr.John Doe",
                message: "because the pain is fun",
                time: "12:00 PM"),
            //RECENT CHAT CARD
            const SizedBox(
              height: 50,
            ),
            //SCHEDULES CARD
            const Text(
              "Schedules Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SchedulesCard(
                image: "assets/images/profile_image.png",
                docName: "Dr.John Doe",
                specialization: "Heart Surgeon",
                hospitalName: "National hospital",
                time: "10:00 AM",
                date: "12/09/21"),
            //SCHEDULES CARD
            const SizedBox(
              height: 50,
            ),
            //SCHOOLS ATTENDED
            const Text(
              "Schools Attended Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SchoolsAttendedCard(
                schoolName:
                    "Kwame Nkrumah University of Science and Technology",
                program: "Bsc. Computer Science",
                year: "2016 - 2021"),
            //SCHOOLS ATTENDED
            const SizedBox(
              height: 50,
            ),
            //SEARCH
            const Text(
              "Search",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const Search(),
            //SEARCH
            const SizedBox(
              height: 50,
            ),
            //STORE LISTING
            const Text(
              "My Stores",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const storeListing(storeName: "Pandora Drug Store"),
            //STORE LISTING
            const SizedBox(
              height: 50,
            ),

            //TOP DOCTORS CARD
            const Text(
              "Top Doctors Card",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const TopDoctor(
                image: "assets/images/doctor-1.png",
                docName: "Sussan Agams",
                specialization: "Heart Surgery",
                experience: 5),
            //TOP DOCTORS CARD
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      )),
    );
  }
}
