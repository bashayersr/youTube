import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/routes/rout.dart';
import 'home/screen/main_screen.dart';
import 'home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'youtub-clone',
      theme: ThemeData(),
      home: MainScreen(),
      // initialRoute: Routes.homepage,
      // getPages: AppRoutes.routes,
      //NavScreen
      //HomePage
    );
  }
}
