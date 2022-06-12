class FavoriteModel {
  FavoriteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );

  static List<FavoriteModel> toJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => FavoriteModel.fromJson(e)).toList();
  }
}
