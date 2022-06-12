import 'dart:convert';
import 'package:dicoding_resto/data/api/api.dart';
import 'package:dicoding_resto/data/models/detail_resto_model.dart';
import 'package:dicoding_resto/data/models/search_resto_model.dart';
import 'package:dicoding_resto/helper/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/resto_model.dart';
import '../data/models/review_resto_model.dart';

class RestoController extends GetxController {
  final TextEditingController _nameCustomer = TextEditingController(text: '');

  TextEditingController get nameCustomer => _nameCustomer;

  final TextEditingController _reviewCustomer = TextEditingController(text: '');

  TextEditingController get reviewCustomer => _reviewCustomer;

  final Api _api = Api();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<RestaurantSummary> _listResto = [];

  List<RestaurantSummary> get listResto => _listResto;

  List<SearchRestoModel> _searchListResto = [];

  List<SearchRestoModel> get searchListResto => _searchListResto;

  RestaurantDetail? _restaurantDetail;

  RestaurantDetail? get restaurantDetail => _restaurantDetail;

  void infoMessage(String massage) {
    Get.snackbar('Info', massage);
  }

  Future<void> fetchListResto() async {
    try {
      _isLoading = true;

      Restaurants snapshot = await _api.getListResto();

      List<RestaurantSummary> data = snapshot.restaurants;

      if (data.isNotEmpty) {
        for (var element in data) {
          listResto.add(element);
        }
        update();
      }

      _isLoading = false;
    } catch (e) {
      infoMessage('Tidak ada internet');
    }
  }

  Future<void> fetchSearchListResto(String query) async {
    try {
      _isLoading = true;

      if (query.isEmpty) {
        infoMessage('Kata kunci tidak boleh kosong');
      } else {
        SearchResto snapshot = await _api.getSearchListResto(query);

        List<SearchRestoModel> data = snapshot.searchRestoModel;

        if (data.isNotEmpty) {
          _searchListResto = data;
          update();
        }

        if (snapshot.founded == 0) {
          searchListResto.clear();
          update();
          infoMessage('Restoran tidak ditemukan');
        }
      }

      _isLoading = false;
    } catch (e) {
      infoMessage('Tidak ada internet');
    }
  }

  Future<void> fetchDetailResto(String id) async {
    try {
      _isLoading = true;

      RestaurantDetail snapshot = await _api.getDetailResto(id);

      _restaurantDetail = snapshot;

      update();

      _isLoading = false;
    } catch (e) {
      infoMessage('Tidak ada internet');
      rethrow;
    }
  }

  Future<dynamic> addRestaurantReview(String id) async {
    try {
      String body = jsonEncode(
        {
          "id": id,
          "name": nameCustomer.text,
          "review": reviewCustomer.text,
        },
      );

      final ReviewRestoModel addRestaurantReview =
          await _api.postAddReviewResto(body);

      return addRestaurantReview;
    } catch (e) {
      rethrow;
    }
  }

  void goToSearchPage() {
    searchListResto.clear();

    update();

    Get.toNamed(Routes.searchPage);
  }

  Future<void> sendReview(String id) async {
    if (nameCustomer.text.isEmpty) {
      infoMessage('Nama tidak boleh kosong');
    } else if (reviewCustomer.text.isEmpty) {
      infoMessage('Review tidak boleh kosong');
    } else {
      await addRestaurantReview(id);

      nameCustomer.clear();

      reviewCustomer.clear();

      update();

      infoMessage('Review Berhasil di Kirim');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchListResto();
  }
}
