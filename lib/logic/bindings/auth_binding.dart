import 'package:youtube/logic/controllers/youtube/AppController.dart';
import 'package:youtube/logic/controllers/auth/AuthController.dart';
import 'package:get/get.dart';
import 'package:youtube/logic/repository/YoutubeRepository.dart';




class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());

    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());

  }
}