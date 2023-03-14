// To parse this JSON data, do
//
//     final categoryType = categoryTypeFromJson(jsonString);

import 'dart:convert';

List<CategoryType> categoryTypeFromJson(String str) => List<CategoryType>.from(json.decode(str).map((x) => CategoryType.fromJson(x)));

String categoryTypeToJson(List<CategoryType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryType {
  CategoryType({
    required this.categoryTypeId,
    required this.categoryTypeName,
  });

  String categoryTypeId;
  String categoryTypeName;

  factory CategoryType.fromJson(Map<String, dynamic> json) => CategoryType(
    categoryTypeId: json["categoryTypeID"],
    categoryTypeName: json["categoryTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "categoryTypeID": categoryTypeId,
    "categoryTypeName": categoryTypeName,
  };
}
