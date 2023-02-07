import 'package:get/get.dart';
import 'package:youtube/logic/controllers/youtube/app_controller.dart';
import 'package:youtube/logic/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {

    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
