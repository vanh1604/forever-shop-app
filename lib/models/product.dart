class Product {
  String id;
  String name;
  String description;
  int price;
  List<String> image;
  String category;
  String subCategory;
  List<String> sizes;
  bool bestseller;
  int date;
  int v;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.subCategory,
    required this.sizes,
    required this.bestseller,
    required this.date,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: List<String>.from(json["image"].map((x) => x)),
    category: json["category"],
    subCategory: json["subCategory"],
    sizes: List<String>.from(json["sizes"].map((x) => x)),
    bestseller: json["bestseller"],
    date: json["date"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": List<dynamic>.from(image.map((x) => x)),
    "category": category,
    "subCategory": subCategory,
    "sizes": List<dynamic>.from(sizes.map((x) => x)),
    "bestseller": bestseller,
    "date": date,
    "__v": v,
  };
}
