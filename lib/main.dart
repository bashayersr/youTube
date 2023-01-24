import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtube_clone_app/Home/app.dart';
import 'package:youtube_clone_app/Home/binding/init_binding.dart';
import 'package:youtube_clone_app/Home/components/youtube_detail.dart';
import 'package:youtube_clone_app/Home/controller/youtube_detail_controller.dart';
import 'package:youtube_clone_app/Home/controller/youtube_search_controller.dart';
import 'package:youtube_clone_app/Home/pages/youtube_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
          name: "/detail/:videoId",
          page: () => YoutubeDetail(),
          binding: BindingsBuilder(
                () => Get.lazyPut<YoutubeDetailController>(
                    () => YoutubeDetailController()),
          ),
        ),
        GetPage(
          name: "/search",
          page: () => YoutubeSearch(),
          binding: BindingsBuilder(
                () => Get.lazyPut<YoutubeSearchController>(
                    () => YoutubeSearchController()),
          ),
        )
      ],
    );
  }
}
