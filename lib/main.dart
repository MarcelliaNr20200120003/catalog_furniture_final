import 'package:catalog_furniture_final/app/controller/controllers/auth_controller_controller.dart';
import 'package:catalog_furniture_final/app/modules/home/views/home_view.dart';
import 'package:catalog_furniture_final/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'Catalog Furniture',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthControllerController(), permanent: true);
  runApp(
    StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return GetMaterialApp(
          title: "My Task Management",
          initialRoute: snapshot.data != null ? Routes.HOME : Routes.WELCOME,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // Get.put(AuthControllerController(), permanent: true);
//   runApp(MyApp()
//       // StreamBuilder<User?>(
//       // builder: (context, snapshot) {
//       //   if (snapshot.connectionState == ConnectionState.waiting) {
//       //     return const Center(child: CircularProgressIndicator());
//       //   }
//       // return
//       //     GetMaterialApp(
//       //   title: "My Task Management",
//       //   initialRoute: Routes.WELCOME,
//       //   getPages: AppPages.routes,
//       //   debugShowCheckedModeBanner: false,
//       // )
//       //     // },
//       //     // )
//       );
// }

// class MyApp extends StatelessWidget {
//   final authC = Get.put(AuthControllerController(), permanent: true);

//   @override
//   Widget build(BuildContext context) {
//     const MaterialApp();
//     return StreamBuilder(
//       stream: authC.streamAuthStatus,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           print(snapshot.data);
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Application',
//             initialRoute:
//                 snapshot.data != null && snapshot.data!.emailVerified == true
//                     ? Routes.HOME
//                     : Routes.WELCOME,
//             getPages: AppPages.routes,
//           );
//         }
//         return CircularProgressIndicator();
//       },
//       // builder: authC.streamAuthStatus,
//     );
//   }
// }
