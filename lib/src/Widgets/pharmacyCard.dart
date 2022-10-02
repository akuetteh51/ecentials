import 'dart:developer';

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state/pharmacy_state.dart';
import '../app_state/user_state.dart';

class PharmacyCard extends StatefulWidget {
  final String pharmacyName;
  final String location;
  final String address;
  final String country;
  final String logo;
  final String pharmacyId;
  final int index;
  final Function onFav;
  const PharmacyCard({
    Key? key,
    required this.pharmacyName,
    required this.location,
    required this.address,
    required this.country,
    this.logo = "",
    required this.onFav,
    required this.index,
    required this.pharmacyId,
  }) : super(key: key);

  @override
  State<PharmacyCard> createState() => _PharmacyCardState();
}

class _PharmacyCardState extends State<PharmacyCard> {
  String shortenLongString(String str) {
    if (str.length <= 23) {
      return str;
    } else {
      return str.substring(0, 19) + "...";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);

      pharmacyState.getFavoritePharmacies(
          token: userState.userInfo?['token'] ?? "");

      log("message");
    });
  }

  @override
  Widget build(BuildContext context) {
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    return SizedBox(
      height: 200.0,
      width: 174.0,
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  pharmacyState.gettingUserFavoritePharmacies == 2
                      ? (pharmacyState.pharmacyBookmarkingIndexes
                              .contains(widget.index)
                          ? SizedBox(
                              width: 30,
                              height: 30,
                              child: Center(
                                child: SizedBox(
                                  height: 13,
                                  width: 13,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: AppColors.primaryDeepColor,
                                  ),
                                ),
                              ),
                            )
                          : pharmacyState.userFAVpharmacies
                                  .contains(widget.pharmacyId)
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.bookmark,
                                    // EcentialsIcons.heart_fill,
                                    color: Colors.amber,
                                  ),
                                  onPressed: () {
                                    widget.onFav.call();
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.bookmark_add_outlined,
                                    // EcentialsIcons.heart_fill,
                                    color: Colors.amber,
                                  ),
                                  onPressed: () {
                                    widget.onFav.call();
                                  },
                                ))
                      : Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 255, 255, 255),
                          highlightColor:
                              const Color.fromARGB(255, 206, 200, 200),
                          enabled: true,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.bookmark,
                                // EcentialsIcons.heart_fill,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 8.0, 9.0),
              child: Center(
                child:
                    // logo.isNotEmpty?
                    //  Image.network(
                    //  logo,
                    //   height: 50.0,
                    //   width: 50.0,
                    // ):
                    Image.asset(
                  "assets/images/cross_pharm.png",
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            Center(
              child: Text(
                shortenLongString(widget.pharmacyName),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                " -${shortenLongString(widget.location)}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 13.0),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
                shortenLongString(widget.address),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
