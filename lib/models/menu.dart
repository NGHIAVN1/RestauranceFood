
class MenuFood {
  final String name;
  final String image;
  final double price;
  final String description;
  final String category;
  final String id;

  MenuFood(
    {
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.id,
  });

  factory MenuFood.fromJson(Map<String, dynamic> json) {
    return MenuFood(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      id: json['id'],
    );
  }
}