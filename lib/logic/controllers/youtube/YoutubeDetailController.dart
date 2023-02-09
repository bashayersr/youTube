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
  late YoutubePlayerController playController;  // take time after init
  late VideoController videoController=Get.put(VideoController(video: video.value));

  @override
  void onInit() {
    VideoController videoController=Get.put(VideoController(video: video.value));
    videoController = Get.find(tag: Get.parameters["videoId"]);
    video(videoController.video);
    statistics(videoController.statistics.value);
    youtuber(videoController.youtuber.value);
    _event();
    super.onInit();
    update();
  }

  void _event() {
    playController = YoutubePlayerController(
      initialVideoId: video.value.id!.videoId!,  // open v after give id
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,  // no controle
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,  // sc
        
      ),
    );
  }
}
