import 'package:dicoding_resto/controller/resto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/utils/constans/theme.dart';
import '../widget/search_resto_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final restoController = Get.find<RestoController>();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cari & Temukan',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Restoran ',
                style: greenTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
                children: [
                  TextSpan(
                    text: ' Favoritmu',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: greyColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: Image.asset(
                'assets/icon_search.png',
                width: 26,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: restoController.searchEditingController,
                onFieldSubmitted: (String? query) =>
                    restoController.fetchSearchListResto(query!),
                decoration: InputDecoration.collapsed(
                  hintText: 'Cari Resto',
                  hintStyle: greyTextStyle.copyWith(fontWeight: medium),
                ),
              ),
            ),
            const Icon(
              Icons.location_on,
              color: greyColor,
            ),
          ],
        ),
      );
    }

    Widget gridViewResto() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Text(
              'Hasil Pencarian',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          GetBuilder<RestoController>(
            builder: (_) {
              if (restoController.searchListResto.isEmpty) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.16),
                  child: const Hero(
                    tag: 'search',
                    child: Icon(
                      Icons.search,
                      size: 100,
                    ),
                  ),
                ));
              }
              return restoController.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      itemCount: restoController.searchListResto.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultMargin,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 18,
                      ),
                      itemBuilder: (context, index) {
                        return SearchRestoCard(
                          resto: restoController.searchListResto[index],
                        );
                      },
                    );
            },
          )
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          search(),
          gridViewResto(),
        ],
      ),
    );
  }
}
