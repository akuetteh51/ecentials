class UserHealthInfoModel {
  final String? name;
  final String? address;
  final String? email;
  final String? gender;
  final String? occupation;
  final String? dob;
  final String? ghana_card_number;
  final String? phone;
  final int? height;
  final int? weight;

  UserHealthInfoModel({this.name, this.address, this.gender, this.occupation, this.phone, this.height, this.weight,this.dob,this.ghana_card_number,this.email});

  factory UserHealthInfoModel.fromJson(Map<String,dynamic> data){
      return UserHealthInfoModel(
        name: data["name"] ?? "", 
        address: data["address"] ?? "",
        gender: data["gender"] ?? "", 
        occupation: data["occupation"] ?? "", 
        phone: data["phone_number"] ?? "", 
        dob: data["dob"]??"", 
        height: data["height"] ?? 0, 
        weight: data["weight"] ?? 0,
        );
  }   
}
