import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/logic/repository/YoutubeRepository.dart';
import 'package:youtube/model/YoutubeVideoResult.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController scrollController = ScrollController(); //to update data

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .LatestVideos(youtubeResult.value.nextPagetoken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;  //not rebeate videos
        youtube?.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }
}
