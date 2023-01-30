import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/components/custom_appbar.dart';
import 'package:youtube/Home/components/video_widget.dart';
import 'package:youtube/Home/controller/home_controller.dart';
import 'package:youtube/logic/controllers/auth_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
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
                      AddtoFireBase(controller.youtubeResult.value.items![index].id?.videoId);

                      //page route
                      Get.toNamed(
                          "/detail/${controller.youtubeResult.value.items![index].id?.videoId}");
                    },
                    child: VideoWidget(
                        video: controller.youtubeResult.value.items![index]),
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
    );
  }

  void AddtoFireBase(String? videoId) async{

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.displayUserEmail.value)
        .get();
    Map<String, dynamic> docData = userDoc.data() as Map<String, dynamic>;
    DocumentReference doc =
    FirebaseFirestore.instance.collection("users").doc(authController.displayUserEmail.value);

    docData["history"].add(videoId);
    doc.update({
      "history":docData["history"]
    });
  }
}
