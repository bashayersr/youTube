import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/controller/video_controller.dart';
import 'package:youtube/Home/models/statistics.dart';
import 'package:youtube/Home/models/video.dart';
import 'package:youtube/Home/models/youtuber.dart';
import 'package:youtube/model/userModel.dart';
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

    //method for save video id

    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("videohistory")
        .doc()
        .set(
      {'videoId': playController.initialVideoId.toString()},
    );
    
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
