import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/Home/models/youtube_video_result.dart';
import 'package:youtube_clone_app/Home/repository/youtube_repository.dart';

// this controller is responsible for fetch Getx video 
class GetxVedController extends GetxController {
  static GetxVedController get to => Get.find();

  ScrollController scrollController = ScrollController();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() {
    _videoLoadgetx();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoLoadgetx();
      }
    });
  }

  void _videoLoadgetx() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadGetxVed(youtubeResult.value.nextPagetoken ?? "");

  

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube!.items?.addAll(youtubeVideoResult.items!);
      });
    }
  }
}
