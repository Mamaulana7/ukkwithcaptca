
import '../controllers/page_index_controller.dart';
import '../routes/app_pages.dart';

import 'menu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('id_ID', null);

  Get.put(PageIndexController(), permanent: true);
  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return GetMaterialApp(
          title: "Application",
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.LOGIN,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'inter',
          ),
        );
      }));
}
