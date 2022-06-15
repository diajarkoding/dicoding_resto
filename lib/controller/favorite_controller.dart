import 'package:dicoding_resto/data/database/db_helper.dart';
import 'package:dicoding_resto/data/models/detail_resto_model.dart';
import 'package:dicoding_resto/data/models/favorite_model.dart';
import 'package:dicoding_resto/helper/constans/theme.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteController extends GetxController {
  final DatabaseHelper _db = DatabaseHelper();

  final String _tableName = 'favorite';

  final RxList<FavoriteModel> _favoriteList = <FavoriteModel>[].obs;

  RxList<FavoriteModel> get favoriteList => _favoriteList;

  void infoMessage(String message) {
    Get.snackbar(
      'Info',
      message,
      backgroundColor: whiteColor,
    );
  }

  Future<void> addFavorite(RestaurantDetail resto) async {
    Database database = await _db.database;

    List checkData =
        await database.query(_tableName, where: "id = '${resto.id}'");

    if (checkData.isEmpty) {
      await database.insert(
        _tableName,
        {
          "id": resto.id,
          "name": resto.name,
          "description": resto.description,
          "city": resto.city,
          "pictureId": resto.pictureId,
          "rating": resto.rating,
        },
      );

      fetchFavoriteList();

      infoMessage('Berhasil menambahkan restoran ke favorit');
    } else {
      deleteFavorite(resto.id);

      infoMessage('Menghapus restoran dari favorit');
    }
  }

  Future<void> fetchFavoriteList() async {
    Database database = await _db.database;

    List<Map<String, dynamic>> data = await database.query(_tableName);

    if (data.isNotEmpty) {
      favoriteList(
        FavoriteModel.toJsonList(data),
      );

      favoriteList.refresh();
    } else {
      favoriteList.clear();

      favoriteList.refresh();
    }
  }

  bool setFavorite(RestaurantDetail resto) {
    if (favoriteList.indexWhere((element) => element.id == resto.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> deleteFavorite(String id) async {
    Database database = await _db.database;

    await database.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    fetchFavoriteList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteList();
  }
}
