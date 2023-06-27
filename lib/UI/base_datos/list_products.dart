class Product {
  final String? id;
  final String? name;
  String? price;
  String? desc;
  String? imageDefault;
  String? imageFront;

  Product(
      {required this.name,
      required this.desc,
      required this.price,
      required this.id,
      required this.imageDefault,
      required this.imageFront});
}
