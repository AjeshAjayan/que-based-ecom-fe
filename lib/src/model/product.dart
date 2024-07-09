class Product {
  final String title;

  Product(this.title);

  Product.fromJSON(Map<String, dynamic> json) : title = json["title"] as String;

  Map<String, dynamic> toJSON() {
    return {
      'title': title,
    };
  }
}
