import 'package:atrule_tech/models/tech_list_model.dart';

class TechModel {
  TechModel({
    this.techId,
    this.techName,
    this.techNameList,
  });

  String techId;
  String techName;
  List<TechListModel> techNameList;

  factory TechModel.fromJson(Map<String, dynamic> json) => TechModel(
    techId: json["techId"],
    techName: json["techName"],
    techNameList: List<TechListModel>.from(json["techNameList"].map((x) => TechListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "techId": techId,
    "techName": techName,
    "techNameList": List<dynamic>.from(techNameList.map((x) => x.toJson())),
  };
}