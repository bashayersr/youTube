import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:youtube/Home/controller/getx_controller.dart';
import 'package:youtube/Home/models/statistics.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';

class ExploreController extends GetxController {
  @override
  void onInit() {
    getVideoHistoiry();

    super.onInit();
  }

  Future<dynamic> getVideoHistoiry() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("videohistory")
        .doc()
        .get();

    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById('9Lj492u6EEk');
  }
}
