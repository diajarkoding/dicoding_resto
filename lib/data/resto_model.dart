import 'dart:convert';
import 'package:flutter/material.dart';

class Restaurant {
  Restaurant({
    required this.restaurants,
  });

  List<RestaurantElement> restaurants;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurants: List<RestaurantElement>.from(
            json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
      );
}

class RestaurantElement {
  RestaurantElement({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  factory RestaurantElement.fromJson(Map<String, dynamic> json) =>
      RestaurantElement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Foods> foods;
  List<Drink> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Foods>.from(json["foods"].map((x) => Foods.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );
}

class Foods {
  Foods({
    required this.name,
  });

  String name;

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        name: json["name"],
      );
}

class Drink {
  Drink({
    required this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );
}

Future<List<RestaurantElement>> getDataResto(BuildContext context) async {
  final jsonData =
      await DefaultAssetBundle.of(context).loadString('assets/restaurant.json');

  Map<String, dynamic> parsed = jsonDecode(jsonData);

  Restaurant data = Restaurant.fromJson(parsed);

  List<RestaurantElement> resto = data.restaurants;

  return resto;
}
