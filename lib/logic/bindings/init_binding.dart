import 'package:get/get.dart';
import 'package:youtube/logic/controllers/youtube/AppController.dart';
import 'package:youtube/logic/repository/YoutubeRepository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {

    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
