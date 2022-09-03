class HospitalDataModel {
  final String? name;
  final String? address;
  final String? opening_hours;
  final String? phone_number;
  final List? image;

  HospitalDataModel(
      {this.name,
      this.address,
      this.opening_hours,
      this.phone_number,
      this.image});

  factory HospitalDataModel.fromJson(Map<String, dynamic> data) {
    return HospitalDataModel(
      name: data["name"] ?? "",
      address: data["address"] ?? "",
      opening_hours: data["opening_hours"] ?? "",
      phone_number: data["phone_number"] ?? "",
      image: data["images"] ?? "",
    );
  }
}
