// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/logic/controllers/auth/auth_controller.dart';
import 'package:youtube/logic/controllers/youtube/home_controller.dart';
import 'package:youtube/views/components/custom_appbar.dart';
import 'package:youtube/views/components/video_widget.dart';

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
                      AddtoFireBase(controller
                          .youtubeResult.value.items![index].id?.videoId);

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

  // sve video to firebase
  void AddtoFireBase(String? videoId) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.displayUserEmail.value)
        .get();
    Map<String, dynamic> docData = userDoc.data() as Map<String, dynamic>;
    DocumentReference doc = FirebaseFirestore.instance
        .collection("users")
        .doc(authController.displayUserEmail.value);
        
    // List<dynamic> x = docData["history"];
    try {
      if (docData["history"].contains(videoId)) {
        docData["history"].remove(videoId);
        docData["history"].add(videoId);
        doc.update({"history": docData["history"]});
        return print('video already added to user history');
      } else {
        docData["history"].add(videoId);
        doc.update({"history": docData["history"]});
      }
    } catch (e) {
      print(e);
    }
  }
}
