class PositionsModel {
  PositionsModel({
    this.id,
    this.position,
  });

  String id;
  String position;

  factory PositionsModel.fromJson(Map<String, dynamic> json) => PositionsModel(
    id: json["id"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
  };
}