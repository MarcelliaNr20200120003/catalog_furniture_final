import 'package:catalog_furniture_final/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:ionicons/ionicons.dart';

// import 'package:catalog_furniture/constants.dart';
import 'package:catalog_furniture_final/app/modules/product/views/product_view.dart';

import '../../constants/views/constants_view.dart';

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
      body: const Home(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: const Icon(Ionicons.backspace),
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
          icon: const Icon(Ionicons.basket),
          onPressed: () {},
        ),
      ],
    );
  }
}
