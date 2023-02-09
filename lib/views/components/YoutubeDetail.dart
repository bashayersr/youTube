import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:youtube/ConnectMongo.dart';
import 'package:youtube/logic/controllers/auth/AuthController.dart';
import 'package:youtube/logic/controllers/youtube/YoutubeDetailController.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  final authController = Get.find<AuthController>();

   YoutubeDetail({super.key});

  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.video.value.snippet!.title!,
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  "Views ${controller.statistics.value.viewCount ?? '-'}",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Text(" · "),
                Text(
                  DateFormat("yyyy-MM-dd")
                      .format(controller.video.value.snippet!.publishTime!),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Obx(
        () => Text(
          controller.video.value.snippet!.description!,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text,BuildContext context) {
    return Column(
      children: [
        // SvgPicture.asset("assets/svg/icons/$iconPath.svg"),
        IconButton(
            onPressed: () async {
              var user = await MongoDatabase.userCollection.findOne({"email":authController.displayUserEmail.value});
              print(user["history"]);
              List< dynamic>  historyList=user["history"].toList();
              if(iconPath=="like" )
                historyList[0]["like"]=1;
                else if(iconPath=="dislike")
                historyList[0]["dislike"]=1;
                else if (iconPath=="share")
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("URL Has Copied")));

              MongoDatabase.userCollection.update(where.eq("email",authController.displayUserEmail.value),modify.set("history",historyList));

            },
            icon: SvgPicture.asset("assets/svg/icons/$iconPath.svg")
           ),
        Text(text),

      ],
    );
  }

  Widget _buttonZone(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttonOne("like", controller.statistics.value.likeCount.toString(),context),
          _buttonOne(
              "dislike", controller.statistics.value.dislikeCount.toString(),context),
          _buttonOne("share", "share",context),
          _buttonOne("save", "save",context),
        ],
      ),
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.black.withOpacity(0.1),
      );

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: GetBuilder<YoutubeDetailController>(builder: (controller) {
       return  Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(
                      controller.youtuber.value.snippet!.thumbnails!.medium!.url!)
                  .image,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    controller.youtuber.value.snippet!.title!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "  ${controller.youtuber.value.statistics!.subscriberCount}",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.6)),
                  ),
                ],
      
              ),
            ),
      
            GestureDetector(
              child: Text(
                "",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          ],
        );
   } ),
    );
  }

  Widget _description(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _buttonZone(context),
          SizedBox(height: 20),
          line,
          _ownerZone()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.playController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.playController.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {},
            onEnded: (data) {},
          ),
          Expanded(
            child: _description(context),
          )
        ],
      ),
    );
  }
}
