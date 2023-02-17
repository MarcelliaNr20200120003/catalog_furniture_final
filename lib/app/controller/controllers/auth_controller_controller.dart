import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalog_furniture_final/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
}
