import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube/ConnectMongo.dart';
import 'package:youtube/firebase_options.dart';
import 'package:youtube/logic/bindings/auth_binding.dart';
import 'package:youtube/logic/controllers/youtube/AppController.dart';
import 'package:youtube/routes/Routes.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();

  runApp(MyApp());
}

class MyApp extends GetView<AppController> {
  // const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      // return Scaffold(
      //   body: Obx(() {
      //     switch (RouteName.values[controller.currentIndex.value]) {
      //       case RouteName.Home:
      //         return Home();
      //
      //       case RouteName.DartVid:
      //         return Subsecribtion(); // rout to subsecribtion page
      //       case RouteName.CleanCode:
      //         Get.delete<CleanCodeController>();
      //         return Library(); // rout to subsecribtion Library
      //       case RouteName.Add:
      //         break;
      //     }
      //     return Container();
      //   }),
      //   bottomNavigationBar: Obx(
      //     () => BottomNavigationBar(
      //       type: BottomNavigationBarType.fixed,
      //       currentIndex: controller.currentIndex.value,
      //       showSelectedLabels: true,
      //       selectedItemColor: Colors.black,
      //       onTap: controller.changePageIndex,
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
      //           activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
      //           label: "home",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             "assets/svg/icons/compass_off.svg",
      //             width: 22,
      //           ),
      //           activeIcon: SvgPicture.asset(
      //             "assets/svg/icons/compass_on.svg",
      //             width: 22,
      //           ),
      //           label: "explore",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Padding(
      //             padding: const EdgeInsets.only(top: 8.0),
      //             child: SvgPicture.asset(
      //               "assets/svg/icons/plus.svg",
      //               width: 35,
      //             ),
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
      //           activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
      //           label: "subsecriabtion",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
      //           activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
      //           label: "library",
      //         ),
      //       ],
      //     ),
      //   ),
      // );
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
    });
  }
}
