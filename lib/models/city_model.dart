class CitiesModel {
  CitiesModel({
    this.id,
    this.city,
  });

  String id;
  String city;

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
    id: json["id"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
  };
}