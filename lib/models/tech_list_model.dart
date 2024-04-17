class TechListModel {
  TechListModel({
    this.id,
    this.name,
    this.image,
  });

  String id;
  String name;
  String image;

  factory TechListModel.fromJson(Map<String, dynamic> json) => TechListModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}