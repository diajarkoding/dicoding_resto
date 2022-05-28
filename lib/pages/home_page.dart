import 'package:dicoding_resto/data/resto_model.dart';
import 'package:dicoding_resto/widget/resto_card.dart';
import 'package:dicoding_resto/utils/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          vertical: defaultMargin,
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
              child: TextField(
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
              'Daftar Restoran',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          FutureBuilder<List<RestaurantElement>>(
            future: getDataResto(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RestaurantElement> resto = snapshot.data!;
                return GridView(
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
                    children: resto
                        .map(
                          (e) => RestoCard(
                            resto: e,
                          ),
                        )
                        .toList());
              }
              return const Center(
                child: Text('Tidak ada data'),
              );
            },
          ),
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
