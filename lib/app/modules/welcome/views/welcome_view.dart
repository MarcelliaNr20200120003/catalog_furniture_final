import 'package:catalog_furniture_final/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login/views/login_view.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 80,
                  ),
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/icons/getstar.jpg"),
                      )),
                ),
                Expanded(
                    child: Container(
                  child: SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1, left: 29, right: 20),
                        child: Text(
                          "Discover Your Own Dream House",
                          style: GoogleFonts.acme(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 29, right: 20),
                        child: Text(
                          "Make your home a minimalist look at an affordable price",
                          style: GoogleFonts.amethysta(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 22,
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: const Color(0xFF000000)),
                        ),
                      ),
                      SizedBox(height: 120),
                    ],
                  )),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
