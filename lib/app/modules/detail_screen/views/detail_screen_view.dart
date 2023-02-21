import 'dart:math';

import 'package:catalog_furniture_final/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ionicons/ionicons.dart';

// import 'package:catalog_furniture/constants.dart';
import 'package:catalog_furniture_final/app/modules/product/views/product_view.dart';

import '../../constants/views/constants_view.dart';

//import 'components/body.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Container(
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Column(children: [
                  SizedBox(
                    height: 100,
                    child: Row(children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.arrow_back_ios)),
                      Text('Kembali'),
                    ]),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(Get.arguments['image']),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        Get.arguments['name'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text("Rp. ${Get.arguments['price']}"

                          // style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      Text(Get.arguments['description'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: "Lato",
                          )
                          //Theme.of(context).textTheme.bodySmall,
                          ),
                    ],
                  ))
                ]),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("-"),
                  ),
                ),
              ),
            ]),

            // child: Column(children: [
            //   Text(
            //     Get.arguments['name'],
            //     style: const TextStyle(color: Colors.white),
            //   ),
            //   Text(
            //     Get.arguments['id'],
            //     style: const TextStyle(color: Colors.white),
            //   ),
            // ]),
          ),
        ));
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
