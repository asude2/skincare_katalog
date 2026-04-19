class Product {
  final int id;
  final String name;
  final String brand;
  final String description;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  //json dan veri çekiyoruz
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}

List<Product> cartItems = [];