class GraphicsPModel {
  GraphicsPModel({
    this.id,
    this.image,
  });

  String id;
  String image;

  factory GraphicsPModel.fromJson(Map<String, dynamic> json) => GraphicsPModel(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}