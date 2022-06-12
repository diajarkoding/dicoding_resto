import 'package:dicoding_resto/controller/favorite_controller.dart';
import 'package:dicoding_resto/controller/resto_controller.dart';
import 'package:dicoding_resto/helper/routes/route_name.dart';
import 'package:dicoding_resto/widget/category_card.dart';
import 'package:dicoding_resto/widget/menus_widget.dart';
import 'package:dicoding_resto/widget/review_result_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/detail_resto_model.dart';
import '../helper/constans/theme.dart';
import '../widget/custom_button.dart';

class DetailPage extends StatelessWidget {
  final String id;
  DetailPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final restoController = Get.find<RestoController>();
  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage(String id) {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                '$imageUrl$id',
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 170,
        margin: const EdgeInsets.only(
          top: 230,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(1.0),
            ],
          ),
        ),
      );
    }

    Widget favoriteButton(RestaurantDetail resto) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 40,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              favoriteController.addFavorite(resto);
            },
            child: Obx(
              () => Image.asset(
                favoriteController.setFavorite(resto)
                    ? 'assets/btn_is_favorite_green.png'
                    : 'assets/btn_favorite.png',
                width: 40,
              ),
            ),
          ),
        ),
      );
    }

    Widget nameCityRating(String name, String city, double rating) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          180,
          defaultMargin,
          0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '$city, Indonesia',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 7.5,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_star_1.png',
                    width: 16,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    rating.toString(),
                    style: blackTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget description(String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: blackTextStyle.copyWith(fontWeight: reguler),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget category(List<Category> categories) {
      return Padding(
        padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children:
                  categories.map((e) => CategoryCard(text: e.name)).toList(),
            ),
          ],
        ),
      );
    }

    Widget foods(Menus menus) {
      return Padding(
        padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Makanan',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children:
                    menus.foods.map((e) => MenusWidget(text: e.name)).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget drinks(Menus menus) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          0,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Minuman',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Column(
                children: menus.drinks
                    .map(
                      (e) => MenusWidget(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget reviewButton(RestaurantDetail resto) {
      return CustomButton(
        text: 'Tulis Review',
        width: 0.2,
        onPressed: () => Get.toNamed(
          Routes.reviewPage,
          arguments: resto,
        ),
        icon: Icons.reviews,
      );
    }

    Widget lineDivider() {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Divider(
          color: Colors.black,
          thickness: 0.2,
        ),
      );
    }

    Widget reviewResult(List<CustomerReviewResult> customerReviewResult) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
            ),
            child: Text(
              'Review Customer',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
          ),
          Column(
            children: customerReviewResult
                .map(
                  (e) => ReviewResultCard(
                      name: e.name, date: e.date, review: e.review),
                )
                .toList(),
          ),
        ],
      );
    }

    Widget content(
        String name,
        String city,
        double rating,
        String text,
        Menus menus,
        List<Category> categories,
        List<CustomerReviewResult> customerReviewResult,
        RestaurantDetail resto) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          favoriteButton(resto),
          nameCityRating(name, city, rating),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: defaultMargin),
            padding: const EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                description(text),
                category(categories),
                foods(
                  menus,
                ),
                drinks(
                  menus,
                ),
                reviewButton(resto),
                lineDivider(),
                reviewResult(customerReviewResult),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: GetBuilder<RestoController>(
        init: restoController,
        initState: (_) async {
          await restoController.fetchDetailResto(id);
        },
        builder: (_) {
          final restaurantDetail = restoController.restaurantDetail;

          return restoController.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      backgroundImage(restaurantDetail!.pictureId),
                      customShadow(),
                      content(
                        restaurantDetail.name,
                        restaurantDetail.city,
                        restaurantDetail.rating,
                        restaurantDetail.description,
                        restaurantDetail.menus,
                        restaurantDetail.categories,
                        restaurantDetail.customerReviews,
                        restaurantDetail,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
