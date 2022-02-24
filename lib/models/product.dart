// import 'dart:convert';
//
// Product productFromJson(String str) => Product.fromJson(json.decode(str));
//
// String productToJson(Product data) => json.encode(data.toJson());
//
// class Product {
//   Product({
//     this.count,
//     this.products,
//   });
//
//   int count;
//   List<ProductElement> products;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     count: json["count"],
//     products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "products": List<dynamic>.from(products.map((x) => x.toJson())),
//   };
// }
//
// class ProductElement {
//   ProductElement({
//     this.category,
//     this.name,
//     this.price,
//     this.quantity,
//     this.description,
//     this.image,
//     this.id,
//   });
//
//   Category category;
//   String name;
//   double price;
//   int quantity;
//   String description;
//   String image;
//   int id;
//
//   factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
//     category: categoryValues.map[json["category"]],
//     name: json["name"],
//     price: json["price"].toDouble(),
//     quantity: json["quantity"],
//     description: json["description"],
//     image: json["image"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category": categoryValues.reverse[category],
//     "name": name,
//     "price": price,
//     "quantity": quantity,
//     "description": description,
//     "image": image,
//     "id": id,
//   };
// }
//
// enum Category { ELECTRONICS, SHOES }
//
// final categoryValues = EnumValues({
//   "Electronics": Category.ELECTRONICS,
//   "Shoes": Category.SHOES
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }