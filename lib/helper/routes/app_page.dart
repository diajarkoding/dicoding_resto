import 'package:dicoding_resto/pages/favorite_page.dart';
import 'package:dicoding_resto/pages/home_page.dart';
import 'package:dicoding_resto/pages/review_page.dart';
import 'package:dicoding_resto/pages/search_page.dart';
import 'package:dicoding_resto/pages/setting_page.dart';
import 'package:get/get.dart';
import 'route_name.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.favoritePage,
      page: () => FavoritePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.settingPage,
      page: () => const SettingPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.searchPage,
      page: () => SearchPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.reviewPage,
      page: () => ReviewPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
