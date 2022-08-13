import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/MyStoreHome.dart';
import 'package:flutter/material.dart';

class EnterStoreDetails extends StatelessWidget {
  const EnterStoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        height: 120,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
          child: Button(
            text: "Create ",
            width: 302,
            radius: 20,
            style: TextStyle(color: Colors.white, fontSize: 15),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => storeHome(),
                ),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/create_store.png",
              height: 128,
              width: 128,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35),
                child: Center(
                    child: Text(
                  "This information is used to set up your store",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Store Name',
                  hintText: 'Enter Store Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Store Description',
                  hintText: 'Enter Description',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'e.g 125 Akufor Street,Makola ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'e.g Accra',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'OTCMLS(Lisense) Number',
                  hintText: 'Lisense Number',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
