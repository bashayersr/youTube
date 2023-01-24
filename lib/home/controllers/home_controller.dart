import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/defualt.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController scrollController = ScrollController();

  Rx<YoutubeVideoResult> ytResult = YoutubeVideoResult(items: []).obs;

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult = await YoutubeVideoResult.to.la(ytResult.value.nextPagetoken ?? "");
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0) {
      ytResult.update((youtube) {
        youtube?.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube?.items.addAll(youtubeVideoResult.items);
      });
    }
  }
}
