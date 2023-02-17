import 'package:catalog_furniture_final/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:catalog_furniture_final/app/modules/product_card/views/product_card_view.dart';
// import 'package:catalog_furniture/constants.dart';
import 'package:catalog_furniture_final/app/modules/product/views/product_view.dart';

import '../../constants/views/constants_view.dart';
import '../../tambah_catalog/views/tambah_catalog_view.dart';

// import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Home(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: Icon(Ionicons.backspace),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Ionicons.basket),
          onPressed: () {},
        ),
      ],
    );
  }
}
