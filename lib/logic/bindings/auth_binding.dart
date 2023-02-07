import 'package:youtube/logic/controllers/youtube/app_controller.dart';
import 'package:youtube/logic/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:youtube/logic/repository/youtube_repository.dart';




class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());

    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());

  }
}