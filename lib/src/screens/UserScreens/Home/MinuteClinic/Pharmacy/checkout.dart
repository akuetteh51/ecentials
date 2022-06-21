import 'package:flutter/material.dart';

import '../../../../../Themes/colors.dart';

/// Provides a user with delivery and payment options
/// and a summary of the transaction to be performed.
///
/// check design screen checkout under pharmacy mocks
/// to see details.
class PharmacyCheckOut extends StatefulWidget {
  const PharmacyCheckOut({Key? key}) : super(key: key);

  @override
  _PharmacyCheckOutState createState() => _PharmacyCheckOutState();
}

class _PharmacyCheckOutState extends State<PharmacyCheckOut> {
  var checkoutLevels = ["Delivery", "Payment", "Summary"];
  var selectedLevel = 0;

  // delivery address details
  var name = 'Susan Anukem';
  var address = 'Kpone Police Barrier';
  var region = 'Greater Accra-Tema';
  var phoneNumber = '+233559748280';

  // delivery date details
  var startDate = 'Tuesday 6 Nov';
  var endDate = 'Wednesday 17 Nov';

  var drugName = 'Ibuprofen (3)';
  var fulFilled = 'Fulfilled by Pharmacy A';

  var isChecked = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:
          Color(int.parse("#DADADA".substring(1, 7), radix: 16) + 0xFF000000),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(
                    bottom: 5.0, left: 15.0, right: 15.0, top: 35.0),
                decoration: BoxDecoration(color: AppColors.primaryWhiteColor),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.15),
                          child: const Icon(Icons.arrow_back),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Text(
                                "Secure Checkout",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Image.asset('assets/images/correctPn.png',
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.05)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: checkoutLevels.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2,
                                mainAxisSpacing: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedLevel = index;
                                      });
                                    },
                                    child: Text(
                                      checkoutLevels[index],
                                      style: TextStyle(
                                          color: selectedLevel == index
                                              ? AppColors
                                                  .primaryCheckoutLevelTextColor
                                              : const Color.fromRGBO(
                                                  144, 152, 177, 1)),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all(selectedLevel == index
                                                ? AppColors
                                                    .primaryCheckoutLevelButtonColor
                                                : AppColors.primaryGrayColor)),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Delivery Address",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 15.0, left: 5.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      address,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.primaryDeliveryDetailsTextColor,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      region,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.primaryDeliveryDetailsTextColor,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.primaryDeliveryDetailsTextColor,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Change Address",
                              style: TextStyle(
                                  color:
                                      AppColors.primaryCheckoutLevelTextColor,
                                  fontSize: 13.0,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Delivery Date",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 20.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: 'Montserrat'),
                      children: [
                        const TextSpan(text: "Between "),
                        TextSpan(
                            text: startDate,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: " and "),
                        TextSpan(
                            text: endDate,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Shipment Summary",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    fontFamily: 'Montserrat'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  right: 10.0,
                  top: 5.0,
                ),
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 14.5),
                      child: Text("Shipment 2 of 2",
                          style: TextStyle(fontFamily: 'Montserrat')),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                fillColor: MaterialStateProperty.all(
                                    AppColors.primaryCheckoutLevelTextColor),
                              ),
                              Text(drugName,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                  ))
                            ],
                          ),
                        ),
                        Text(fulFilled,
                            style: const TextStyle(fontFamily: 'Montserrat'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                fillColor: MaterialStateProperty.all(
                                    AppColors.primaryCheckoutLevelTextColor),
                              ),
                              Text(drugName,
                                  style:
                                      const TextStyle(fontFamily: 'Montserrat'))
                            ],
                          ),
                        ),
                        Text(fulFilled,
                            style: const TextStyle(fontFamily: 'Montserrat'))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              padding: const EdgeInsets.only(
                  right: 15.0, top: 25.0, left: 15, bottom: 125.0),
              decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Items Total",
                          style: TextStyle(fontFamily: 'Montserrat')),
                      Text("\$500.00",
                          style: TextStyle(fontFamily: 'Montserrat'))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Shipping Fees",
                          style: TextStyle(fontFamily: 'Montserrat')),
                      Text("\$50.00",
                          style: TextStyle(fontFamily: 'Montserrat'))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style:
                            TextStyle(fontSize: 18.0, fontFamily: 'Montserrat'),
                      ),
                      Text(
                        "\$550.00",
                        style: TextStyle(
                            color: AppColors.primaryCheckoutLevelTextColor,
                            fontSize: 18.0,
                            fontFamily: 'Montserrat'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Apply Voucher",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.primaryCheckoutLevelTextColor,
                            fontSize: 13.0,
                            decoration: TextDecoration.underline),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryPaymentMethodBtnColor)),
                        child: const Text(
                          'Choose Payment Method',
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: 'Montserrat'),
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            backgroundColor: AppColors.primaryPaymentMethodBtnColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(15.0),
                                
                                height: 400,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Text(
                                      'Choose payment method',
                                      style: TextStyle(
                                          color: AppColors.primaryWhiteColor,
                                          fontSize: 16.0,
                                          fontFamily: 'Montserrat'),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                    paymentDetailsOne(),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    paymentDetailsTwo(),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 1,
                                      height: MediaQuery.of(context).size.height * 0.07,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          side: const BorderSide(color: Colors.white, width: 1),
                                          backgroundColor: AppColors.primaryPaymentMethodBtnColor,
                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                                        ),

                                        child: const Text('+  Add Account', style: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat', color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 1,
                                      height: MediaQuery.of(context).size.height * 0.07,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.primarySwipeToPayBtnColor,
                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                                        ),

                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: MediaQuery.of(context).size.width * 0.22
                                              ),
                                              child: Image.asset('assets/images/circle-arrow-black.png'),
                                            ),
                                            Text('Swipe to pay', style: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat', color: AppColors.primaryBlackColor))
                                          ],
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// ecentials wallet widget
  Widget paymentDetailsOne() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.primaryWhiteColor,
      border: const Border(bottom: BorderSide(
        color: Color.fromRGBO(203, 63, 4, 1),
        width: 3.0
      ))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/ellipse-32.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/ecentials_logo2.png'),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child:  Text(
                  "Ending 8988",
                  style: TextStyle(fontSize: 12.0, fontFamily: 'Montserrat'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// credit card widget
  Widget paymentDetailsTwo() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.primaryWhiteColor,
      borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Image.asset('assets/images/credit-card-2.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Credit Card",
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(94, 87, 87, 0.83)),
              ),
              Text(
                "Home Account",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'),
              ),
              Text(
                "**** **** **** 2541",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
