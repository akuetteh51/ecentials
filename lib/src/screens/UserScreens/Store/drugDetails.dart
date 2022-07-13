import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DrugDetails extends StatefulWidget {
  const DrugDetails({Key? key}) : super(key: key);

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  final _details = [
    {
      "title": "Condition",
      "subtitle": "Stable",
    },
    {
      "title": "Dosage",
      "subtitle": "3 times daily",
    },
    {
      "title": "Price Type",
      "subtitle": "Fixed",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            foregroundColor: AppColors.primaryBlackColor,
            backgroundColor: AppColors.primaryWhiteColor,
            expandedHeight: height * 0.45,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/acetalx.png",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -5),
                    color: AppColors.primaryBlackColor.withOpacity(.10),
                    blurRadius: 5.0,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Prooduct: sp125",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.60),
                      ),
                    ),
                    Text(
                      "Acetamenophen",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlackColor.withOpacity(.90),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                color: AppColors.primaryBlackColor
                                    .withOpacity(.60),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ghc 30",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBlackColor),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offer Price",
                              style: TextStyle(
                                color: AppColors.primaryBlackColor
                                    .withOpacity(.60),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ghc 15",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBlackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Product Description",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.60),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Soluta, tenetur? Illo dolor porro incidunt veritatis quae. Temporibus cum asperiores animi porro nihil? Doloribus tempore laboriosam natus et quaerat nobis ipsam.",
                      style: TextStyle(color: AppColors.primaryBlackColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            ListTile(
                              title: Text(
                                _details[index]["title"].toString(),
                                style: TextStyle(
                                  color: AppColors.primaryBlackColor
                                      .withOpacity(.60),
                                ),
                              ),
                              subtitle: Text(
                                _details[index]["subtitle"].toString(),
                                style: TextStyle(
                                  color: AppColors.primaryBlackColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              endIndent: 10,
                              indent: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
