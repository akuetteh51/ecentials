class AllPharmaciesPreview {
  final String? id;
  final String? name;
  final String? user_id;
  final String? store_pin;
  final String? description;
  final String? address;
  final String? city;
  final String? licence_no;
  final String? logo;
  final bool? accept_nhis;
  final  gps_lat;
  final  gps_lng;
  AllPharmaciesPreview({this.id, this.user_id, this.store_pin, this.description, this.address, this.city, this.licence_no, this.logo, this.accept_nhis, this.gps_lat, this.gps_lng, this.name});

  factory AllPharmaciesPreview.fromJson(data) {
    return AllPharmaciesPreview(
      logo: data['logo'] ?? "",
      name: data['name'] ?? "",
      description: data['description'] ?? "",
      address: data['address'] ?? "" ,
      city: data['city'] ?? "",
      accept_nhis: data['accept_nhis'] ?? false,
      licence_no: data['licence_no'] ?? "",
      gps_lat: data['gps_lat'] ?? 0.0,
      gps_lng: data['gps_lng'] ?? 0.0,
      id: data['_id'] ?? "",
      store_pin: data['store_pin'] ?? "",
      user_id: data['user_id'] ?? "",);
  }
}

        // {
        //     "_id": "62c81cce8faa7ded917bd066",
        //     "user_id": "62bb2d4c2298ae2667c39e26",
        //     "store_pin": "$2a$10$Q/CEJqutnoRJDs2GcA4i4.oo0HAiEPkdbKv/IF2XHZ2.fc53p9SA2",
        //     "name": "Medicina Pharmacy",
        //     "description": "The best Pharmacy you will find around for any drugs you want",
        //     "address": "kk fosu street",
        //     "city": "Tema",
        //     "is_verified": false,
        //     "licence_no": "AFJJ88493",
        //     "logo": "https://www.google.com",
        //     "accept_nhis": true,
        //     "gps_lat": 392,
        //     "gps_lng": 12,
        //     "date_added": "2022-07-08T12:02:22.174Z",
        //     "createdAt": "2022-07-08T12:02:22.178Z",
        //     "updatedAt": "2022-07-08T12:02:22.178Z",
        //     "__v": 0
        // },