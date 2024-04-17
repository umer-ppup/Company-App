class MobilePModel {
  MobilePModel({
    this.id,
    this.image,
    this.link,
  });

  String id;
  String image;
  String link;

  factory MobilePModel.fromJson(Map<String, dynamic> json) => MobilePModel(
    id: json["id"],
    image: json["image"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "link": link,
  };
}