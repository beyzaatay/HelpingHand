class categories {
  final String? food;
  final String? dress;
  final String? medicine;
  final String? shoe;
  final String? hygiene_products;
  final String? blanket;
  final String? diaper;
  final String? coat;

  categories({
    this.food,
    this.dress,
    this.medicine,
    this.shoe,
    this.hygiene_products,
    this.blanket,
    this.diaper,
    this.coat,
  });

  factory categories.fromJson(Map<String, dynamic> json) {
    return categories(
      food: json['food'],
      dress: json['dress'],
      medicine: json['medicine'],
      shoe: json['shoe'],
      hygiene_products: json['hygiene_products'],
      blanket: json['blanket'],
      diaper: json['diaper'],
      coat: json['coat'],
    );
  }
}
