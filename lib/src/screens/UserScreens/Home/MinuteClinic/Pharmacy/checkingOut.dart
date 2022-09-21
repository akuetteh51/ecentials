import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/manageAddresses.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckingOut extends StatefulWidget {
  const CheckingOut({Key? key}) : super(key: key);

  @override
  State<CheckingOut> createState() => _CheckingOutState();
}

class _CheckingOutState extends State<CheckingOut> {
  List<String> checkoutLevels = ["Delivery", "Payment", "Summary"];
  List<Map<String, dynamic>> paymentMethods = [
    {"name": "Mobile Money", "image": "assets/images/momo.png"},
    {"name": "Credit/Debit Card", "image": "assets/images/card_holder.png"},
    {"name": "Paypal", "image": "assets/images/paypal.png"},
    {"name": "Bitcoin", "image": "assets/images/Bitcoin.png"}
  ];
  final _pageController = PageController();
  int curPage = 0;
  int? diliveryAddressIndex;
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('EEEE, d, MMMM, y');
  int checkoutState = 0;
  createCheckout() async {
    CartState cartState = Provider.of<CartState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);
    return await cartState.checkOut(
        token: userState.userInfo?['token'],
        diliveryAddressIndex: diliveryAddressIndex);
  }

  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    DateTime fromDiliveryDate = DateTime(now.year, now.month + 1, now.day);
    DateTime toDiliveryDate = DateTime(now.year, now.month + 1, now.day + 8);
    return Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          leading: const BackButton(),
          title: Text("Secure Checkout",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlackColor.withAlpha(180))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(
                'assets/images/correctPn.png',
                height: 20,
                width: 20,
              ),
            )
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: checkoutLevels.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Center(
                          child: Text(
                            checkoutLevels[index],
                            style: TextStyle(
                                fontSize: 16,
                                color: curPage == index
                                    ? AppColors.primaryCheckoutLevelTextColor
                                    : const Color.fromRGBO(144, 152, 177, 1)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: curPage == index
                                ? AppColors.primaryCheckoutLevelButtonColor
                                : AppColors.primaryGrayColor),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 120),
                  child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) => setState(() {
                            curPage = page;
                          }),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Dilivery Address",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryBlackColor
                                              .withAlpha(180))),
                                  InkWell(
                                      onTap: () async {
                                        final i = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ManageAddress(
                                                      checkingOut: true)),
                                        );
                                        setState(() {
                                          diliveryAddressIndex = i;
                                        });
                                      },
                                      child: Text("Change",
                                          style: TextStyle(
                                              color: AppColors
                                                  .primaryOrangeColor)))
                                ],
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${diliveryAddressIndex == null ? cartState.addresses.firstWhere((address) => address.primary == true).name : cartState.addresses[diliveryAddressIndex!].name},",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "${diliveryAddressIndex == null ? cartState.StringifyAddressLocation(cartState.addresses.firstWhere((address) => address.primary == true)) : cartState.StringifyAddressLocation(cartState.addresses[diliveryAddressIndex!])}, GH",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Dilivery Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryBlackColor
                                          .withAlpha(180))),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Between ${formatter.format(fromDiliveryDate)} and ${formatter.format(toDiliveryDate)}",
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Dilivery Summary",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryBlackColor
                                          .withAlpha(180))),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cartState.cart.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${cartState.cart[index].drug.name ?? "Ibuprofen"}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
                                            Text(
                                                "${cartState.cart[index].quantity}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ))
                                          ],
                                        ),
                                      )),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub Total: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryBlackColor
                                              .withAlpha(210))),
                                  Text("GHc ${cartState.subTotal.toString()}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryDeepColor
                                              .withAlpha(180))),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Dilivery Fee: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryBlackColor
                                              .withAlpha(210))),
                                  Text("GHc ${"20"}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryDeepColor
                                              .withAlpha(180))),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryBlackColor
                                              .withAlpha(210))),
                                  Text(
                                      "GHc ${(cartState.subTotal + 20).toString()}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryOrangeColor)),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Text("Apply Voucher",
                                      style: TextStyle(
                                          color:
                                              AppColors.primaryOrangeColor))),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Choose Payment Method",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlackColor
                                        .withAlpha(180))),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: paymentMethods.length,
                              itemBuilder: (context, index) => ListTile(
                                minVerticalPadding: 14,
                                onTap: () async {
                                  setState(() {
                                    checkoutState = 1;
                                  });
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                  int res = await createCheckout();
                                  setState(() {
                                    checkoutState = res;
                                  });
                                },
                                leading: Image.asset(
                                    paymentMethods[index]["image"],
                                    width: 42,
                                    height: 42,
                                    fit: BoxFit.contain),
                                title: Text(
                                  paymentMethods[index]["name"],
                                  style: const TextStyle(fontSize: 18),
                                ),
                                trailing:
                                    const Icon(Icons.chevron_right_rounded),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 18,
                            ),
                            checkoutState == 1
                                ? Column(
                                    children: [
                                      CircularProgressIndicator(
                                        color: AppColors.primaryDeepColor,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      const Text("Checking Out")
                                    ],
                                  )
                                : checkoutState == 2
                                    ? Column(
                                        children: [
                                          Image.asset(
                                              "assets/images/created.png",
                                              height: 100,
                                              width: 100),
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          const Text(
                                              "Your order has been placed successfully",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      )
                                    : checkoutState == 3
                                        ? const Text(
                                            "There was an error placing your order, please try again",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))
                                        : const SizedBox.shrink()
                          ],
                        ),
                      ]),
                ),
              ),
            ]),
        bottomSheet: Container(
          color: AppColors.primaryWhiteColor,
          height: 100,
          child: curPage == 0 ||
                  curPage == checkoutLevels.length - 1 && checkoutState == 2
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Button(
                          text: curPage == 0 ? "Proceed to Payment" : "Orders",
                          onTap: () {
                            if (curPage == checkoutLevels.length - 1) {
                              Get.to(() => const Cart());
                              return;
                            }
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          style:
                              TextStyle(color: AppColors.primaryWhiteColor))))
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                        onTap: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        child: Text("Back",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryOrangeColor))),
                  ),
                ),
        ));
  }
}
