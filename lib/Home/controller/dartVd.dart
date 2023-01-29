import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/models/youtube_video_result.dart';
import 'package:youtube/Home/repository/youtube_repository.dart';

class DartVidController extends GetxController {
  static DartVidController get to => Get.find();

  ScrollController scrollController = ScrollController();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() {
    _videoDart();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoDart();
      }
    });
  }

  void _videoDart() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadDart(youtubeResult.value.nextPagetoken ?? "");

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
