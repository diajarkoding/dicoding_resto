import 'package:dicoding_resto/helper/utils/capitalize.dart';
import 'package:flutter/material.dart';

import '../helper/utils/constans/theme.dart';

class ReviewResultCard extends StatelessWidget {
  final String review;
  final String name;
  final String date;
  const ReviewResultCard({
    Key? key,
    required this.name,
    required this.date,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.fromLTRB(
        defaultMargin,
        defaultMargin,
        defaultMargin,
        0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: greyColor,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              review.capitalize(),
              style: blackTextStyle,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 25,
                  child: const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.capitalize(),
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text(
                    date,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
