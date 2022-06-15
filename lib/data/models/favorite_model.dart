class FavoriteModel {
  FavoriteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

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
