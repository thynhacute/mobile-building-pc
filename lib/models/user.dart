// To parse this JSON data, do
//
//     final component = componentFromJson(jsonString);

import 'dart:convert';

Component componentFromJson(String str) => Component.fromJson(json.decode(str));

String componentToJson(Component data) => json.encode(data.toJson());

class Component {
  Component({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  String accessToken;
  String refreshToken;
  User user;

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    user: User.fromJson(json["User"]),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "User": user.toJson(),
  };
}

class User {
  User({
    required this.userId,
    required this.userName,
    required this.phone,
    this.email,
    this.facebook,
    this.image,
    required this.roleName,
    required this.status,
  });

  String userId;
  String userName;
  String phone;
  dynamic email;
  dynamic facebook;
  dynamic image;
  String roleName;
  int status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userID"],
    userName: json["userName"],
    phone: json["phone"],
    email: json["email"],
    facebook: json["facebook"],
    image: json["image"],
    roleName: json["roleName"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "userID": userId,
    "userName": userName,
    "phone": phone,
    "email": email,
    "facebook": facebook,
    "image": image,
    "roleName": roleName,
    "status": status,
  };
}
