import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/drugDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PrescriptionResults extends StatefulWidget {
  const PrescriptionResults({Key? key}) : super(key: key);

  @override
  State<PrescriptionResults> createState() => _PrescriptionResultsState();
}

class _PrescriptionResultsState extends State<PrescriptionResults> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          foregroundColor: AppColors.primaryBlackColor,
          backgroundColor: AppColors.primaryWhiteColor,
          expandedHeight: height * 0.4,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/dr_pres2.png",
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Drugs",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlackColor.withAlpha(180))),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          onTap: () {
                            // Get.to(
                            //   () => DrugDetails(
                            //       details: ),
                            // );
                          },
                          child: DrugCard(
                              drugName: "Ibuprofen",
                              drugType: "Tablet",
                              quantity: 50,
                              price: 2.00),
                        )),
                const SizedBox(height: 24),
                Text("Note",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlackColor.withAlpha(180))),
                const SizedBox(height: 18),
                Text(
                    '''Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,
quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos 
sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam
recusandae alias error harum maxime adipisci amet laborum. Perspiciatis 
minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit 
quibusdam sed amet tempora. Sit laborum ab, eius fugit doloribus tenetur ''')
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
