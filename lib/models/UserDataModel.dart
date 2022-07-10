class UserDataModel {
  final String? name;
  final String? address;
  final String? gender;
  final String? occupation;
  final String? dob;
  final String? ghana_card_number;
  final dynamic gps_coordinates;
  final int? phone;
  final int? height;
  final int? weight;

  UserDataModel({this.name, this.address, this.gender, this.occupation, this.phone, this.height, this.weight,this.dob,this.ghana_card_number,this.gps_coordinates});

  factory UserDataModel.fromJson(Map<String,dynamic> data){
      return UserDataModel(
        name: data["name"], 
        address: data["address"],
        gender: data["gender"], 
        occupation: data["occupation"], 
        phone: data["phone_number"], 
        dob: data["dob"], 
        height: data["height"], 
        weight: data["weight"],
        gps_coordinates: data["gps_coordinates"],
        );
  }

   
}
