class PopularPharmacy {
  final String? id;
  final String? name;
  // final String? user_id;
  final String? dosage;
  final String? store_id;
  final String? description;
  final int? quantity;
  final int? views;
  final String? dosage_form;
  final String? manufacturer;
  final discount;
  final nhis;
  final prize;
  final List? images;
  PopularPharmacy({this.prize, 
      this.dosage,
      this.store_id,
      this.quantity,
      this.views,
      this.dosage_form,
      this.manufacturer,
      this.discount,
      this.nhis,
      this.images,
      this.id,
      this.description,
      this.name});

  factory PopularPharmacy.fromJson(data) {
    return PopularPharmacy(
      id: data['_id'] ?? "",
      description: data['description'] ?? "",
      name: data['name'] ?? "",
      discount: data['discount'] ?? 0,
      dosage: data['dosage'] ?? "",
      dosage_form: data['dosage_form'] ?? "",
      images: data['images'] ?? [],
      manufacturer: data['manufacturer'] ?? "",
      nhis: data['nhis'] ?? "",
      quantity: data['quantity'] ?? 0,
      store_id: data['store_id'] ?? "",
      views: data['views'] ?? 0,
      prize: data['prize'] ?? 0.0,
    );
  }
}

  // {
  // _id: 62cd942ac6377c69b61b632e, 
  // store_id: 62c81cce8faa7ded917bd066, 
  // name: paracetamol, prize: 1,
  // description: serious paracetamol, 
  // dosage: twice daily. one in the morning then one in the evening, 
  // quantity: 1, 
  //dosage_form: tablet, 
  // manufacturer: Ernest Chemist, 
  // views: 10, 
  // discount: 0.2, 
  // nhis: 0, 
  // images: [https://www.google.com], 
  // createdAt: 2022-07-12T15:32:58.315Z, 
  // updatedAt: 2022-07-18T21:20:30.726Z, 
  // __v: 0
  // }
