import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:youtube/ConnectMongo.dart';
import 'package:youtube/logic/repository/YoutubeRepository.dart';
import 'package:youtube/model/Video.dart';
import 'package:youtube/model/YoutubeVideoResult.dart';
import 'package:youtube/logic/controllers/auth/AuthController.dart';

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
    var user = await MongoDatabase.userCollection.findOne({"email":authController.displayUserEmail.value});
    // to get user from collection  and his email
    List<dynamic> historyList = [];
    historyList.clear();
    historyList = user["history"];
    for(final e in historyList){
      Video? youtubeVideoResult = await YoutubeRepository.to.getVideoByID(e["id"]); // id from repo
      youtubeVideoResult != null? {
        youtubeResult.update(
              (youtube) {
            youtube?.items!.insert(0,youtubeVideoResult);
            youtube?.items![0].history=e["date"];
          },
        )
      }:print("");

    }

  }
}
