class Product {
  String id;
  String name;
  List<Category> categories;
  List<String> images;
  String price;
  String author;
  String publisher;
  DateTime publishedDate;
  int numPage;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int stock;

  Product({
    required this.id,
    required this.name,
    required this.categories,
    required this.images,
    required this.price,
    required this.author,
    required this.publisher,
    required this.publishedDate,
    required this.numPage,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
    images: List<String>.from(json["images"].map((x) => x)),
    price: json["price"],
    author: json["author"],
    publisher: json["publisher"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    numPage: json["numPage"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    stock: json["stock"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x)),
    "price": price,
    "author": author,
    "publisher": publisher,
    "publishedDate": publishedDate.toIso8601String(),
    "numPage": numPage,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "stock": stock,
  };
}

class Category {
  String id;
  String name;
  String image;
  bool isNewArrival;
  String description;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.isNewArrival,
    required this.description,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    isNewArrival: json["isNewArrival"],
    description: json["description"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "isNewArrival": isNewArrival,
    "description": description,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
