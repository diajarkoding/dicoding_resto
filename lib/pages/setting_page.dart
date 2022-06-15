import 'package:dicoding_resto/widget/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notification_controller.dart';
import '../helper/constans/theme.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          bottom: 10,
        ),
        child: Text(
          'Pengaturan',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget boxListTileSettings(BuildContext context) {
      return Expanded(
        child: ListTile(
          leading: const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Icon(
              Icons.notifications,
              color: greenColor,
            ),
          ),
          title: Text(
            'Notifikasi Restoran',
            style: blackTextStyle,
          ),
          subtitle: Text(
            'Ingatkan saya pukul 11 A.M',
            style: blackTextStyle,
          ),
          trailing: GetBuilder<NotificationController>(
            init: Get.put(NotificationController()),
            builder: (c) {
              return Switch.adaptive(
                value: c.isSwitch,
                onChanged: (value) async {
                  await c.scheduleRestaurant(value);
                },
                activeColor: greenColor,
                activeTrackColor: Colors.grey,
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: CustomBottomNavBarItem(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            boxListTileSettings(context),
          ],
        ),
      ),
    );
  }
}
