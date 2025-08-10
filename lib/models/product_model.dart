class ProductModel {
  final String image;
  final String name;
  final double price;
  final String description;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}

final List<ProductModel> products = [
  ProductModel(
    image: "assets/prouct/Rectangle 344 (5).png",
    name: 'October',
    price: 120,
    description: "reversible angora cardigan",
  ),
  ProductModel(
    image: "assets/prouct/Rectangle 344 (4).png",
    name: 'October',
    price: 200,
    description: "reversible angora cardigan",
  ),
  ProductModel(
    image: "assets/prouct/Rectangle 344 (3).png",
    name: 'October',
    price: 260,
    description: "reversible angora cardigan",
  ),
  ProductModel(
    image: "assets/prouct/Rectangle 344 (2).png",
    name: 'October',
    price: 100,
    description: "reversible angora cardigan",
  ),
  ProductModel(
    image: "assets/prouct/Rectangle 344.png",
    name: 'October',
    price: 70,
    description: "reversible angora cardigan",
  ),
  ProductModel(
    image: "assets/prouct/Rectangle 344 (1).png",
    name: 'October',
    price: 80,
    description: "reversible angora cardigan",
  ),
];
