// To parse this JSON data, do
//
//     final component = componentFromJson(jsonString);

import 'dart:convert';

List<Component> componentFromJson(String str) => List<Component>.from(json.decode(str).map((x) => Component.fromJson(x)));

String componentToJson(List<Component> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Component {
  Component({
    required this.componentId,
    required this.componentName,
    required this.price,
    required this.amount,
    required this.image,
    this.description,
    required this.brandId,
    required this.categoryId,
    required this.feedbackId,
    required this.status,
  });

  int componentId;
  String componentName;
  int price;
  int amount;
  String image;
  String? description;
  int brandId;
  String categoryId;
  int feedbackId;
  int status;

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    componentId: json["componentID"],
    componentName: json["componentName"],
    price: json["price"],
    amount: json["amount"],
    image: json["image"],
    description: json["description"],
    brandId: json["brandID"],
    categoryId: json["categoryID"],
    feedbackId: json["feedbackID"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "componentID": componentId,
    "componentName": componentName,
    "price": price,
    "amount": amount,
    "image": image,
    "description": description,
    "brandID": brandId,
    "categoryID": categoryId,
    "feedbackID": feedbackId,
    "status": status,
  };
}
