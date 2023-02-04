import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAbeJP0_uAJIo3LiSR-Xd3OUd2bVw0YIfs",
    appId: "1:361698027401:web:75ecd8e9e68ede453d2358",
    messagingSenderId: "361698027401",
    projectId: "attendant-b4459",
    authDomain: "attendant-b4459.firebaseapp.com",
    storageBucket: "attendant-b4459.appspot.com",
  )).then(((value) => Get.put(AuthController())));

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
