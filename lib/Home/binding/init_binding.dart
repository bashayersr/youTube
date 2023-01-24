import 'package:get/get.dart';
import 'package:youtube_clone_app/Home/controller/app_controller.dart';
import 'package:youtube_clone_app/Home/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
