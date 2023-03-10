import 'package:get/get.dart';
import 'package:youtube/logic/repository/YoutubeRepository.dart';
import 'package:youtube/model/Statistics.dart';
import 'package:youtube/model/Video.dart';
import 'package:youtube/model/Youtuber.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({required this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id!.videoId!);
    statistics(loadStatistics);
    Youtuber? loadYoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet!.channelId!);  // to give id and give me youtuber
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "Views ${statistics.value.viewCount ?? '-'}";
  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://yt3.ggpht.com/AOBrTKwXRGbGx7EhSodEwT364r-TyuayV2LmwulX9XCt1JP0rOu95Mqf_orVpy1uSaUeun2E=s900-c-k-c0x00ffffff-no-rj";
    return youtuber.value.snippet!.thumbnails!.medium!.url!;
  }
}
