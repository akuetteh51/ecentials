import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class DeliveryMode extends StatefulWidget {
  const DeliveryMode({Key? key}) : super(key: key);

  @override
  State<DeliveryMode> createState() => _DeliveryModeState();
}

class _DeliveryModeState extends State<DeliveryMode> {
  double leftDragger = 1.0;
  @override
  Widget build(BuildContext context) {
    Size vp = MediaQuery.of(context).size;

    return Card(
      color: AppColors.primaryDeepColor,
      margin: const EdgeInsets.all(0),
      elevation: 20,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      child: SizedBox(
        height: (vp.height * .5) + (MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Flexible(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: ListView(
                  // shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Choose payment method",
                          style: TextStyle(
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: vp.width,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, right: 12.0, top: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryDeepColor,
                                          ),
                                          height: 12,
                                          width: 12,
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: vp.width,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          child: Image.asset(
                                              "assets/images/logo.png")),
                                      const Flexible(
                                        child: Text("Ending 5785  "),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryOrangeColor,
                                ),
                                height: 5,
                                width: vp.width,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: vp.width,
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 6),
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryDeepColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Credit Card",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(.6),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Home Account",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(.8),
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "**** **** **** *325",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(.7),
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: vp.width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).canvasColor,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Center(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Add info",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onPanUpdate: (DragUpdateDetails updateDetails) {
                              setState(() {
                                  leftDragger +=
                                  leftDragger + updateDetails.delta.dx;
                              });                            
                            },
                            child: Container(
                              width: vp.width,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrangeColor,
                                  border: Border.all(
                                    color: Theme.of(context).canvasColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Center(
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: const [
                                          Text(
                                            "Swipe to Pay",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 4,
                                    bottom: 4,
                                    left: leftDragger,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryDeepColor,
                                      ),
                                      height: 25,
                                      width: 25,
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget InfoItem({
    Function? ontap,
    String? label,
    String? description,
    IconData? iconData,
    bool? load,
  }) {
    return GestureDetector(
      onTap: () {
        ontap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    // SizedBox(
                    //   width: vp.width,
                    //   child: Wrap(),
                    // ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              iconData ?? Icons.person_outline_rounded,
                              size: 30,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                label ?? "My Account",
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                description ??
                                    "Edit your details, account settings",
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 12,
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  // color: Colors.red,
                  child: load == true
                      ? const CircularProgressIndicator()
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
