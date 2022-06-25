import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/add_product.dart';
import 'package:flutter/material.dart';

class Stores extends StatelessWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        leading: Center(
          child: Container(
            height: 50,
            width: 50,
            decoration:const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/mystore.png"),)
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
            SizedBox(
              width: 50,
            ),
            Text(
              "My Store",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 100,
            ),
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage("assets/images/profilePic.png"),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryWhiteColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                // height: 237,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Center(child: Image.asset("assets/images/Pharmacystore.png",height: 100,width: 100,),),
                   const Text(
                      "Pandora Drug Store",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Image.asset(
                "assets/images/img_5.png",
                height: 120,
                width: 120,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "You don’t have a product",
                  style: TextStyle(fontSize: 14),
                ),
              ),
             const SizedBox(
                height: 50,
              ),
              ButtonOutlined(
                  text: "Add Product",
                  style:const TextStyle(color: Colors.black, fontSize: 18),
                  color:const Color(0xFF0F69B2E),
                  width: 302,
                  height: 40,
                  radius: 20,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddingProduct()));
                  }),

                  const SizedBox(height: 100,),
            ],
          ),
        ],
      ),
    );
  }
}
