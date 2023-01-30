import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/models/video.dart';
import 'package:youtube/Home/models/youtube_video_result.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube/logic/controllers/auth_controller.dart';

class CleanCodeController extends GetxController {
  static CleanCodeController get to => Get.find();

  final authController = Get.find<AuthController>();

  ScrollController scrollController = ScrollController();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  late SharedPreferences _profs;
  String key = "searchKey";
  RxList<String> history = RxList<String>.empty(growable: true);

  @override
  void onInit() {
    _videoCleanCode();
    _event();
    super.onInit();

  }
  // void onInit() async {
  //   _event();
  //   _profs = await SharedPreferences.getInstance();
  //   dynamic initData = _profs.get(key);
  //   history(initData.map<String>((_) => _.toString()).toList());
  //   super.onInit();
  // }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoCleanCode();
      }
    });
  }

  void _videoCleanCode() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.displayUserEmail.value)
        .get();
    Map<String, dynamic> docData = userDoc.data() as Map<String, dynamic>;
    List<dynamic> x = docData["history"];
    print("finallll");
    print(x);
    for (var i = 0; i < x.length; i++) {
    Video? youtubeVideoResult = await YoutubeRepository.to
        .getVideoByID(x[i]);

    if (youtubeVideoResult != null
                ) {
      youtubeResult.update((youtube) {
        // youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube?.items!.add(youtubeVideoResult);
      });
    }
  }
  }
}
