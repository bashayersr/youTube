import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube/Home/app.dart';
import 'package:youtube/Home/binding/init_binding.dart';
import 'package:youtube/Home/components/youtube_detail.dart';
import 'package:youtube/Home/controller/youtube_detail_controller.dart';
import 'package:youtube/Home/controller/youtube_search_controller.dart';
import 'package:youtube/Home/pages/youtube_search.dart';
import 'package:youtube/firebase_options.dart';
import 'package:youtube/logic/bindings/auth_binding.dart';
import 'package:youtube/routes.dart';

void main() async{
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppRoutes.routes,
      initialBinding: AuthBinding(),

    );
  }
  );
  }
}
