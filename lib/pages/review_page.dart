import 'package:dicoding_resto/controller/resto_controller.dart';
import 'package:dicoding_resto/data/models/detail_resto_model.dart';
import 'package:dicoding_resto/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/constans/theme.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key}) : super(key: key);

  final restoController = Get.find<RestoController>();

  final RestaurantDetail resto = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Text(
          'Tulis Review',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget restoReview() {
      return Padding(
        padding: const EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '$imageUrl${resto.pictureId}',
                  width: 130,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    resto.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(
                      text: resto.city,
                      style: greenTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                      ),
                      children: [
                        TextSpan(
                          text: ', Indonesia',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_star_1.png',
                      width: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      resto.rating.toString(),
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.fromLTRB(
          defaultMargin,
          30,
          defaultMargin,
          defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: greyColor,
            width: 1,
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: restoController.nameCustomer,
            decoration: InputDecoration.collapsed(
              hintText: 'Masukkan nama kamu',
              hintStyle: greyTextStyle.copyWith(fontWeight: medium),
            ),
          ),
        ),
      );
    }

    Widget reviewInput() {
      return Container(
        width: double.infinity,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.fromLTRB(
          defaultMargin,
          0,
          defaultMargin,
          30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: greyColor,
            width: 1,
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: restoController.reviewCustomer,
            decoration: InputDecoration.collapsed(
              hintText: 'Masukkan review kamu',
              hintStyle: greyTextStyle.copyWith(fontWeight: medium),
            ),
          ),
        ),
      );
    }

    Widget reviewButton() {
      return CustomButton(
        text: 'Kirim Review',
        width: 0.2,
        onPressed: () => restoController.sendReview(resto.id),
        icon: Icons.send,
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          header(),
          restoReview(),
          nameInput(),
          reviewInput(),
          reviewButton(),
        ],
      ),
    );
  }
}
