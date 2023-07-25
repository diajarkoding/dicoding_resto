import 'package:dicoding_resto/controller/resto_controller.dart';
import 'package:dicoding_resto/widget/list_resto_card.dart';
import 'package:dicoding_resto/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final restoController = Get.find<RestoController>();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hallo,',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Foodies',
                            style: greenTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                            children: [
                              TextSpan(
                                text: ' ...',
                                style: blackTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => restoController.goToSearchPage(),
                  child: const Hero(
                    tag: 'search',
                    child: Icon(
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Cari & Temukan Restoran Favoritmu',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            const SizedBox(
              height: 20,
            )
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
              'Daftar Restoran',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          GetBuilder<RestoController>(
            builder: (_) {
              return restoController.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      itemCount: restoController.listResto.length,
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
                        return ListRestoCard(
                          resto: restoController.listResto[index],
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
          gridViewResto(),
        ],
      ),
    );
  }
}
