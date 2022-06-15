import 'dart:convert';
import 'package:dicoding_resto/data/models/review_resto_model.dart';
import 'package:dicoding_resto/data/models/search_resto_model.dart';
import '../models/detail_resto_model.dart';
import '../models/resto_model.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<Restaurants> getListResto() async {
    final Uri url = Uri.parse('$_baseUrl/list');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = Restaurants.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<SearchResto> getSearchListResto(String query) async {
    Uri url = Uri.parse('$_baseUrl/search?q=$query');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = SearchResto.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<RestaurantDetail> getDetailResto(String id) async {
    final Uri url = Uri.parse('$_baseUrl/detail/$id');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      RestaurantModel restaurantModel =
          RestaurantModel.fromJson(jsonDecode(response.body));

      RestaurantDetail restaurantDetail = restaurantModel.restaurant;

      return restaurantDetail;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<ReviewRestoModel> postAddReviewResto(String body) async {
    final Uri url = Uri.parse('$_baseUrl/review');

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ReviewRestoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
