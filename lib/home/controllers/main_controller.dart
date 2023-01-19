import 'package:get/get.dart';
import 'package:youtube/home/screen/home_screen.dart';
import 'package:youtube/home/screen/library_screen.dart';

import '../screen/subscriptions_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomeScreen(),
    SubscriptionsScreen(),
    LibraryScreen(),
  ].obs;


}