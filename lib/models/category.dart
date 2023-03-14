// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryTypeId,
  });

  String categoryId;
  String categoryName;
  String categoryTypeId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["categoryID"],
    categoryName: json["categoryName"],
    categoryTypeId: json["categoryTypeID"],
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryId,
    "categoryName": categoryName,
    "categoryTypeID": categoryTypeId,
  };
}
