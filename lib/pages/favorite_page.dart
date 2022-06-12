import 'package:dicoding_resto/pages/detail_page.dart';
import 'package:dicoding_resto/widget/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorite_controller.dart';
import '../helper/constans/theme.dart';
import '../widget/custom_bottom_navbar.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    Widget about() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultMargin,
                ),
                child: Text(
                  'Restoran Favorit',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              favoriteController.favoriteList.isNotEmpty
                  ? Column(
                      children: favoriteController.favoriteList
                          .map(
                            (element) => FavoriteCard(
                              favorite: element,
                              toDetail: () => Get.to(
                                () => DetailPage(
                                  id: element.id,
                                ),
                              ),
                              delete: () => favoriteController.deleteFavorite(
                                element.id,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.26),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum ada data',
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Tambahkan restoran favoritmu',
                              style: greyTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            about(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
