import 'package:get/get.dart';
import 'package:youtube_clone_app/Home/components/youtube_bottom_sheet.dart';
  

  //add 
enum RouteName { Home, GetXVd, Add, DartVid, CleanCode }

class AppController extends GetxService {

  static AppController get to => Get.find();


  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }
}

