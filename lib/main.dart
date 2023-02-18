import 'package:catalog_furniture_final/app/controller/controllers/auth_controller_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: '...',
          appId: '...',
          messagingSenderId: '...',
          projectId: '...'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthControllerController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    return StreamBuilder(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            title: 'Application',
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.WELCOME,
            getPages: AppPages.routes,
          );
        }
        return CircularProgressIndicator();
      },
      // builder: authC.streamAuthStatus,
    );
  }
}
