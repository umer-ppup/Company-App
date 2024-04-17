class FollowModel {
  FollowModel({
    this.id,
    this.image,
    this.name,
    this.link,
  });

  String id;
  String image;
  String name;
  String link;

  factory FollowModel.fromJson(Map<String, dynamic> json) => FollowModel(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "link": link,
  };
}