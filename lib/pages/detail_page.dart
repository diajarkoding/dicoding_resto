import 'package:dicoding_resto/widget/foods_and_drinks.dart';
import 'package:dicoding_resto/data/resto_model.dart';
import 'package:dicoding_resto/utils/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final RestaurantElement resto;
  const DetailPage({
    Key? key,
    required this.resto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                resto.pictureId,
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

    Widget nameAndAddress() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          260,
          defaultMargin,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resto.name,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              '${resto.city}, Indonesia',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
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
              resto.description,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget foods() {
      List<Foods> foods = resto.menus.foods;
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          0,
        ),
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
                children: foods
                    .map(
                      (e) => FoodsAndDrinks(
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

    Widget drinks() {
      List<Drink> drinks = resto.menus.drinks;
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
                children: drinks
                    .map(
                      (e) => FoodsAndDrinks(
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

    Widget button() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        height: 55,
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Kunjungi',
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nameAndAddress(),
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
                description(),
                foods(),
                drinks(),
                button(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
