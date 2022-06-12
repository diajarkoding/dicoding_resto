import 'package:dicoding_resto/data/models/favorite_model.dart';
import 'package:dicoding_resto/helper/constans/theme.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteModel favorite;
  final Function() delete;
  final Function() toDetail;

  const FavoriteCard({
    Key? key,
    required this.favorite,
    required this.delete,
    required this.toDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toDetail,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 140,
                height: 110,
                child: Stack(
                  children: [
                    Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/${favorite.pictureId}',
                      width: 140,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star_1.png',
                              width: 16,
                              height: 16,
                            ),
                            Text(
                              '${favorite.rating}',
                              style: whiteTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favorite.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: favorite.city,
                    style: greenTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                    children: [
                      TextSpan(
                        text: ', Indonesia',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: delete,
                  child: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
