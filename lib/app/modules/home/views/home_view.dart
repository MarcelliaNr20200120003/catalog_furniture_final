import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../../category_list/views/category_list_view.dart';
import '../../constants/views/constants_view.dart';
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
    Size size = MediaQuery.of(context).size;

    List<int> list = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            SearchBox(
              onChanged: (value) {},
            ),
            Container(
              color: Colors.white,
              height: 220,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(),
                items: imageSliders,
              ),
            ),
            // CategoryList(),
            // ignore: prefer_const_constructors
            // SizedBox(height: 20.0),
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Our background
                  Container(
                    //height: 300,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 185, 223, 114),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('catalog-home')
                          .snapshots(),
                      builder: (__,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                            "eor",
                            style: TextStyle(
                                fontSize: 100,
                                color: Color.fromARGB(255, 226, 7, 7)),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text(
                            "Loading",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        // var dataMinuman =

                        final kat = snapshot.requireData;
                        return ListView.builder(
                            // here we use our demo procuts list
                            itemCount: kat.size,
                            itemBuilder: (context, int index) {
                              var data = kat.docs[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 20.0 / 2,
                                ),
                                // color: Colors.blueAccent,
                                height: 150,
                                child: InkWell(
                                  onTap: () {
                                    print(kat.docs[index]['name'].toString());
                                    Get.to(DetailsScreen(), arguments: data);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => DetailsScreen(
                                    //             product: product,
                                    //           )),
                                    // );
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: <Widget>[
                                      // Those are our background
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: kBlueColor,
                                          // boxShadow: const [kDefaultShadow],
                                        ),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      // our product image
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Hero(
                                          tag:
                                              '${kat.docs[index]['price'].toString()}',
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: kDefaultPadding),
                                            height: 160,
                                            // image is square but we add extra 20 + 20 padding thats why width is 200
                                            width: 150,
                                            child: Image.asset(
                                              kat.docs[index]['image']
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Product title and price
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: SizedBox(
                                          height: 136,
                                          // our image take 200 width, thats why we set out total width - 200
                                          width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Spacer(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            kDefaultPadding),
                                                child: Text(
                                                  kat.docs[index]['name']
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button,
                                                ),
                                              ),
                                              // it use the available space
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: kDefaultPadding *
                                                      1.5, // 30 padding
                                                  vertical: kDefaultPadding /
                                                      4, // 5 top and bottom
                                                ),
                                                decoration: const BoxDecoration(
                                                  color: kSecondaryColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: Text(
                                                  "\$${kat.docs[index]['price'].toString()}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                ],
              ),
            ),
          ],
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
                              // Color.fromARGB(200, 0, 0, 0),
                              // Color.fromARGB(0, 0, 0, 0)
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
