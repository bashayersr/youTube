import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/models/youtube_video_result.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CleanCodeController extends GetxController {
  static CleanCodeController get to => Get.find();


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
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadCleanCode(youtubeResult.value.nextPagetoken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube?.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }
}
