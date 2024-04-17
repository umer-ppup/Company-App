import 'dart:convert';

class EmployeesModel {
  EmployeesModel({
    this.id,
    this.title,
    this.image,
  });

  String id;
  String title;
  String image;

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
