class OpportunityModel {
  OpportunityModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.education,
    this.experience,
  });

  String id;
  String image;
  String title;
  String description;
  String education;
  String experience;

  factory OpportunityModel.fromJson(Map<String, dynamic> json) => OpportunityModel(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    education: json["education"],
    experience: json["experience"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "description": description,
    "education": education,
    "experience": experience,
  };
}