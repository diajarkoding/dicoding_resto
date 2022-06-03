// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CustomButton extends StatelessWidget {
  String text;
  double width;
  Function() onPressed;
  IconData icon;
  CustomButton(
      {required this.text,
      required this.width,
      required this.onPressed,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * width,
            ),
            Icon(
              icon,
              color: whiteColor,
              size: 28,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
