import 'package:ecentialsclone/src/screens/UserScreens/Store/inventory.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../Themes/colors.dart';
import '../../../Widgets/storecard.dart';
import 'shopDashboard.dart';

class Stores extends StatefulWidget {
  Stores({Key? key}) : super(key: key);

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  final ScrollController _scrollController = ScrollController();

  final _storeinfo = {
    "assets/images/dashboard.png": "Dashboard",
    "assets/images/inventory.png": "Inventory",
    "assets/images/orders.png": "Orders",
    "assets/images/sales.png": "Sales",
  };

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final _pages = [
      const ShopDashboard(),
      const Inventory(),
      const ShopDashboard(),
      const ShopDashboard(),
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: const Text("My Store"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/Pharmacystore.png"),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset("assets/images/Pharmacystore.png"),
              ),
              const Text(
                "Orange Drugs Ltd",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width - 40,
                child: GridView.builder(
                    itemCount: _storeinfo.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => _pages[index]),
                            ),
                          );
                        },
                        child: StoreCard(
                          image: _storeinfo.keys.elementAt(index),
                          text: _storeinfo.values.elementAt(index),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
