import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../category_list/views/category_list_view.dart';
import '../../detail_screen/views/detail_screen_view.dart';
import '../../product/views/product_view.dart';
import '../../product_card/views/product_card_view.dart';
import '../../search_box/views/search_box_view.dart';
import '../controllers/home_controller.dart';

class Home extends StatefulWidget {
  @override
  HomeView createState() => HomeView();
  const Home({Key? key}) : super(key: key);
}

class HomeView extends State<Home> {
  //  HomeView({Key? key, required Product product}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5, 6];
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              SearchBox(
                onChanged: (value) {},
              ),
              Container(
                height: 220,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: imageSliders,
                ),
              ),
              CategoryList(),
              // ignore: prefer_const_constructors
              SizedBox(height: 20.0 / 2),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    // Our background
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 185, 223, 114),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    ListView.builder(
                      // here we use our demo procuts list
                      itemCount: products.length,
                      itemBuilder: (context, index) => ProductCard(
                        itemIndex: index,
                        product: products[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                product: products[index],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.pexels.com/photos/6430742/pexels-photo-6430742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.unsplash.com/photo-1609510368600-883b7f16d121?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=724&q=80',
  'https://media.istockphoto.com/id/1363661385/id/foto/ruang-tamu-bergaya-boho-dengan-kursi-anyaman-sofa-meja-dan-pampas-di-pot-dengan-latar-belakang.webp?s=612x612&w=is&k=20&c=sKb3gnmBCX0hOdsnDO71PxReGP_CjCqSZAXqE8n7EVQ=',
  'https://images.pexels.com/photos/12715506/pexels-photo-12715506.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/12713220/pexels-photo-12713220.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/12617137/pexels-photo-12617137.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 400,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
