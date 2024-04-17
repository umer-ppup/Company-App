class EventModel {
  EventModel({
    this.id,
    this.date,
    this.description,
    this.locationName,
    this.image,
  });

  String id;
  String date;
  String description;
  String locationName;
  String image;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["id"],
    date: json["date"],
    description: json["description"],
    locationName: json["locationName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "description": description,
    "locationName": locationName,
    "image": image,
  };
}
