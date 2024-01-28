class Item {
  int? id;
  String? name;
  String? description;
  String? category;
  int? quantity;
  double? price;
  String? imageUrl;

  Item({
    this.id,
    this.name,
    this.description,
    this.category,
    this.quantity,
    this.price,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    quantity = json['quantity'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }
}
