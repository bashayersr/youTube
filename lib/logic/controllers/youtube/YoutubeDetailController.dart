import 'package:get/get.dart';
import 'package:youtube/logic/controllers/youtube/VideoController.dart';
import 'package:youtube/model/Statistics.dart';
import 'package:youtube/model/Video.dart';
import 'package:youtube/model/Youtuber.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  Rx<Video> video = Video().obs;
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  late YoutubePlayerController playController;

  @override
  void onInit() {
    VideoController videoController = Get.find(tag: Get.parameters["videoId"]);
    video(videoController.video);
    statistics(videoController.statistics.value);
    youtuber(videoController.youtuber.value);
    _event();
    super.onInit();
    update();
  }

  void _event() {
    playController = YoutubePlayerController(
      initialVideoId: video.value.id!.videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        
      ),
    );
  }
}
