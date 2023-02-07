import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:youtube/logic/repository/youtube_repository.dart';
import 'package:youtube/model/video.dart';
import 'package:youtube/model/youtube_video_result.dart';
import 'package:youtube/logic/controllers/auth/auth_controller.dart';

class HistoryController extends GetxController {
  static HistoryController get to => Get.find();
   AuthController authController = Get.find<AuthController>();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  RxList<String> history = RxList<String>.empty(growable: true);

  @override
  void onInit() {
    _history();
      super.onInit();
  }




  void _history() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.displayUserEmail.value)
        .get();
    Map<String, dynamic> docData = userDoc.data() as Map<String, dynamic>;
    List<dynamic> historyList = [];
    historyList.clear();
    historyList = docData["history"];
    for(final e in historyList){
      Video? youtubeVideoResult = await YoutubeRepository.to.getVideoByID(e);
      youtubeVideoResult != null? {
        youtubeResult.update(
              (youtube) {
            youtube?.items!.insert(0,youtubeVideoResult);
          },
        )
      }:print("");

    }

  }
}
