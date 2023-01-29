import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/models/youtube_video_result.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController scrollController = ScrollController();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() {
    _videoLoad();
    _videoLoadgetx();
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
        .loadVideos(youtubeResult.value.nextPagetoken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube?.items!.addAll(youtubeVideoResult.items!);
      });
    }
  }

  void _videoLoadgetx() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadGetxVed(youtubeResult.value.nextPagetoken ?? "");

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
