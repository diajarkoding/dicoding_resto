import 'dart:convert';
import 'package:dicoding_resto/data/api/api.dart';
import 'package:dicoding_resto/data/models/detail_resto_model.dart';
import 'package:dicoding_resto/data/models/search_resto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/resto_model.dart';
import '../data/models/review_resto_model.dart';
import '../pages/search_page.dart';

class RestoController extends GetxController {
  final TextEditingController searchEditingController =
      TextEditingController(text: '');

  final TextEditingController nameCustomer = TextEditingController(text: '');

  final TextEditingController reviewCustomer = TextEditingController(text: '');

  Api api = Api();

  bool isLoading = false;

  List<RestaurantSummary> listResto = [];

  List<SearchRestoModel> searchListResto = [];

  void infoMessage(String massage) {
    Get.snackbar('Info', massage);
  }

  Future<void> fetchListResto() async {
    try {
      isLoading = true;

      Restaurants snapshot = await api.getListResto();

      List<RestaurantSummary> data = snapshot.restaurants;

      if (data.isNotEmpty) {
        for (var element in data) {
          listResto.add(element);
        }
        update();
      }

      isLoading = false;
    } catch (e) {
      infoMessage('Tidak ada internet');
    }
  }

  Future<void> fetchSearchListResto(String query) async {
    try {
      isLoading = true;

      if (query.isEmpty) {
        infoMessage('Kata kunci tidak boleh kosong');
      } else {
        SearchResto snapshot = await api.getSearchListResto(query);

        List<SearchRestoModel> data = snapshot.searchRestoModel;

        if (data.isNotEmpty) {
          searchListResto = data;
          update();
        }

        if (snapshot.founded == 0) {
          searchListResto.clear();
          update();
          infoMessage('Restoran tidak ditemukan');
        }
      }

      isLoading = false;
    } catch (e) {
      infoMessage('Tidak ada internet');
    }
  }

  Future<RestaurantDetail> fetchDetailResto(String id) async {
    try {
      RestaurantDetail snapshot = await api.getDetailResto(id);

      return snapshot;
    } catch (e) {
      infoMessage('Tidak ada internet');
      rethrow;
    }
  }

  Future<dynamic> addRestaurantReview(String id) async {
    try {
      String body = jsonEncode(
        {"id": id, "name": nameCustomer.text, "review": reviewCustomer.text},
      );

      final ReviewRestoModel addRestaurantReview =
          await api.postAddReviewResto(body);

      return addRestaurantReview;
    } catch (e) {
      rethrow;
    }
  }

  void goToSearchPage() {
    searchListResto.clear();

    searchEditingController.clear();

    update();

    Get.to(() => SearchPage());
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
