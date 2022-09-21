class AddressModel {
  String name;
  String mobile;
  String street;
  String town;
  String district;
  String region;
  bool? primary = false;

  AddressModel(
      {required this.name,
      required this.mobile,
      required this.street,
      required this.town,
      required this.district,
      required this.region,
      this.primary = false});

  factory AddressModel.fromJSON(Map<String, dynamic> address) {
    return AddressModel(
        name: address["name"],
        mobile: address["mobile"],
        street: address["street"],
        town: address["town"],
        district: address["district"],
        region: address["region"],
        primary: address["primary"]);
  }
}
