import 'package:flutter/material.dart';
import '../helper/constans/theme.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  const CategoryCard({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: greenColor, width: 1),
      ),
      child: Text(
        text,
        style: blackTextStyle.copyWith(fontWeight: medium),
      ),
    );
  }
}
