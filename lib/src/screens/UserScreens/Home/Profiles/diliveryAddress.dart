import 'package:ecentialsclone/models/AddressModel.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DiliveryAddress extends StatefulWidget {
  DiliveryAddress({Key? key, this.address}) : super(key: key);
  AddressModel? address;

  @override
  State<DiliveryAddress> createState() => _DiliveryAddressState();
}

class _DiliveryAddressState extends State<DiliveryAddress> {
  String name = "",
      mobile = "",
      street = "",
      town = "",
      district = "",
      region = "";
  bool? primary = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.address == null) return;
    primary = widget.address?.primary;
    setState(() {
      name = widget.address!.name;
      mobile = widget.address!.mobile;
      street = widget.address!.street;
      town = widget.address!.town;
      district = widget.address!.district;
      region = widget.address!.region;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          leading: const BackButton(),
          title: Text("${widget.address == null ? "Add" : "Edit"} Address",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlackColor.withAlpha(180))),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formKey,
                  child: Column(children: [
                    textField(
                        label: "Name of Recipient", init: widget.address?.name),
                    textField(label: "Mobile", init: widget.address?.mobile),
                    textField(
                        label: "Street Name", init: widget.address?.street),
                    textField(label: "Town", init: widget.address?.town),
                    textField(
                        label: "District", init: widget.address?.district),
                    textField(label: "Region", init: widget.address?.region),
                  ])),
            ),
            CheckboxListTile(
              value: primary,
              title: const Text(
                "Set as primary address",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  primary = value;
                });
              },
              checkColor: AppColors.primaryDeepColor,
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Button(
                text:
                    widget.address == null ? "Add Address" : "Confirm Changes",
                style: TextStyle(
                  color: AppColors.primaryWhiteColor,
                  fontSize: 20,
                ),
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                  final index = await cartState.addDiliveryAddress(
                      address: AddressModel(
                          name: name,
                          mobile: mobile,
                          street: street,
                          town: town,
                          district: district,
                          region: region));
                  Navigator.pop(context, index);
                },
              ),
            )
          ]),
        ));
  }

  Widget textField({label, init}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + "*",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          cursorColor: AppColors.primaryDeepColor,
          initialValue: init,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3, color: AppColors.primaryDeepColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: AppColors.primaryDeepColor.withOpacity(.5),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).disabledColor.withOpacity(.06),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          validator: (String? value) {
            if (value!.trim().isEmpty) {
              return '$label is required';
            }
            return null;
          },
          onSaved: (value) {
            if (value == null || value.trim() == "") return;
            print("${label}: " + value.toString());
            switch (label) {
              case "Name of Recipient":
                setState(() {
                  name = value.toString();
                });
                break;
              case "Mobile":
                setState(() {
                  mobile = value.toString();
                });
                break;
              case "Street Name":
                setState(() {
                  name = value.toString();
                });
                break;
              case "Town":
                setState(() {
                  town = value.toString();
                });
                break;
              case "District":
                setState(() {
                  district = value.toString();
                });
                break;
              case "Region":
                setState(() {
                  region = value.toString();
                });
                break;

              default:
                setState(() {
                  name = value.toString();
                });
            }
          },
        ),
        const SizedBox(
          height: 26,
        ),
      ],
    );
  }
}
