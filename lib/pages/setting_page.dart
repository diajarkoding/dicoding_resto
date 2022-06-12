import 'package:dicoding_resto/widget/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import '../helper/constans/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const Center(
        child: Text('Setting Page'),
      ),
      bottomNavigationBar: CustomBottomNavBarItem(),
    );
  }
}
