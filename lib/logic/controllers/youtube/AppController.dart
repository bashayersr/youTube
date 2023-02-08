import 'package:get/get.dart';
import 'package:youtube/views/components/YoutubeBottomSheet.dart';


  //add 
enum RouteName { Home, Explore, Add, Subscription, Library }

class AppController extends GetxService {

  static AppController get to => Get.find();


  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    RouteName.values[index] == RouteName.Add?_showBottomSheet():
      currentIndex(index);
      }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }
}

