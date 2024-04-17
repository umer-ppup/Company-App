class ServicesModel {
  ServicesModel({
    this.heading,
    this.detail,
    this.image,
  });

  String heading;
  String detail;
  String image;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    heading: json["heading"],
    detail: json["detail"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "detail": detail,
    "image": image,
  };
}