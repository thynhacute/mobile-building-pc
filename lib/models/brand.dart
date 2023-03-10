// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

List<Brand> brandFromJson(String str) => List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  Brand({
    required this.brandId,
    required this.brandName,
    this.description,
  });

  int brandId;
  String brandName;
  dynamic description;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    brandId: json["brandID"],
    brandName: json["brandName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "brandID": brandId,
    "brandName": brandName,
    "description": description,
  };
}
