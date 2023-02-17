import 'package:get/get.dart';

import '../../main.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/detail_screen/bindings/detail_screen_binding.dart';
import '../modules/detail_screen/views/detail_screen_view.dart';
import '../modules/detail_screen/views/detail_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product/views/product_view.dart';
import '../modules/tambah_catalog/bindings/tambah_catalog_binding.dart';
import '../modules/tambah_catalog/views/tambah_catalog_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
import 'package:catalog_furniture_final/app/modules/product/bindings/product_binding.dart';
import 'package:catalog_furniture_final/app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => Home(),
      // product: Product(
      //     id: 1,
      //     price: 56,
      //     title: "Classic Leather Arm Chair",
      //     description:
      //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
      //     image: "assets/images/Item_1.png")),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const SignInScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_CATALOG,
      page: () => const TambahCatalogView(),
      binding: TambahCatalogBinding(),
    ),
  ];
}
