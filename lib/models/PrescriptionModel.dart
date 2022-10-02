import 'package:intl/intl.dart';

class PrescriptionModel {
  String id;
  String user_id;
  String store_id;
  int status;
  String image;
  List? drugs;
  String createdAt;
  String? updatedAt;

  PrescriptionModel(
      {required this.id,
      required this.user_id,
      this.store_id = "1",
      required this.status,
      required this.image,
      this.drugs,
      required this.createdAt,
      this.updatedAt});

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
        id: json["_id"],
        user_id: json["user_id"],
        store_id: json["store_id"] ?? "1",
        status: json["status"],
        image: json["image"],
        drugs: json["drugs"] ?? [],
        createdAt: getFormattedDateFromFormattedString(
            value: json["createdAt"], currentFormat: "yyyy-MM-ddTHH:mm:ssZ"),
        updatedAt: getFormattedDateFromFormattedString(
            value: json["updatedAt"], currentFormat: "yyyy-MM-ddTHH:mm:ssZ"));
  }
}

getFormattedDateFromFormattedString(
    {required value, required String currentFormat, isUtc = false}) {
  DateTime dateTime = DateTime.now();
  if (value != null || value.isNotEmpty) {
    try {
      dateTime = DateFormat(currentFormat).parse(value, isUtc).toLocal();
    } catch (e) {
      print("$e");
    }
  }
  return DateFormat("EEEE, d, MMMM, y").format(dateTime);
}
