import 'package:youtube/Home/controller/app_controller.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';
import 'package:youtube/logic/controllers/auth_controller.dart';
import 'package:youtube/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';




class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());

    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());

  }
}