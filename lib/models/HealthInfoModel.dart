class UserHealthInfoModel {
  final String? bloodGroup;
  final List<String>? alergies;
  final String? bloodPressure;
  final String? nhisNo;
  final int? pulseRate;
  final int? temperature;

  UserHealthInfoModel({
    this.bloodGroup,
    this.alergies,
    this.bloodPressure,
    this.nhisNo,
    this.pulseRate,
    this.temperature,
  });

  List<String> fiels = [
    "blood_group",
    "alergies",
    "blood_pressure",
    "nhis_no",
    "pulse_rate",
    "temperature"];

  List<String> giveClassFields() {
    return fiels;
  }

  factory UserHealthInfoModel.fromJson(Map<String, dynamic> data) {
    return UserHealthInfoModel(
      bloodGroup: data["blood_group"] ?? "",
      alergies: data["alergies"] ?? "",
      bloodPressure: data["blood_pressure"] ?? "",
      nhisNo: data["nhis_no"] ?? "",
      pulseRate: data["pulse_rate"] ?? 0,
      temperature: data["temperature"] ?? 0,
    );
  }
}
