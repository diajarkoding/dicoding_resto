class SearchResto {
  SearchResto({
    required this.founded,
    required this.searchRestoModel,
  });

  int founded;
  List<SearchRestoModel> searchRestoModel;

  factory SearchResto.fromJson(Map<String, dynamic> json) => SearchResto(
        founded: json["founded"],
        searchRestoModel: List<SearchRestoModel>.from(
            json["restaurants"].map((x) => SearchRestoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "founded": founded,
        "restaurants":
            List<dynamic>.from(searchRestoModel.map((x) => x.toJson())),
      };
}

class SearchRestoModel {
  SearchRestoModel({
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

  factory SearchRestoModel.fromJson(Map<String, dynamic> json) =>
      SearchRestoModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
