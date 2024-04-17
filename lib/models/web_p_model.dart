class WebPModel {
  WebPModel({
    this.id,
    this.image,
    this.link,
  });

  String id;
  String image;
  String link;

  factory WebPModel.fromJson(Map<String, dynamic> json) => WebPModel(
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