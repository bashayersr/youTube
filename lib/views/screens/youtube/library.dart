import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube/logic/controllers/youtube/HistoryController.dart';
import 'package:youtube/routes/Routes.dart';
import 'package:youtube/views/components/CustomAppbar.dart';
import 'package:youtube/views/components/VideoWidget.dart';

class  Library extends StatelessWidget {
   Library({super.key});

   HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return
      FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>("auth") == true
          ?
      SafeArea(
      child: Obx(
            () => CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //page route
                      print(controller.youtubeResult.value.items![index].id);
                      Get.toNamed(
                          "/detail/${controller.youtubeResult.value.items![index].id?.videoId}");
                    },
                    child: VideoWidget(
                        video: controller.youtubeResult.value.items![index]
                    ),
                  );
                },
                childCount: controller.youtubeResult.value.items == null
                    ? 0
                    : controller.youtubeResult.value.items?.length,
              ),
            ),
          ],
        ),
      ),
    )
        : Center(child: TextButton(
    onPressed: () {
    Get.toNamed(Routes.loginScreen);
    },
    child: Text("Please Login")));
  }
}
