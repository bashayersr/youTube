// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:youtube/ConnectMongo.dart';
import 'package:youtube/logic/controllers/auth/AuthController.dart';
import 'package:youtube/logic/controllers/youtube/HomeController.dart';
import 'package:youtube/views/components/CustomAppbar.dart';
import 'package:youtube/views/components/VideoWidget.dart';

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
    // MongoDatabase db=MongoDatabase();

    // DocumentSnapshot userDoc = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(authController.displayUserEmail.value)
    //     .get();
    var user = await MongoDatabase.userCollection.findOne({"email":authController.displayUserEmail.value});
    // Map<String, dynamic> docData = userDoc.data() as Map<String, dynamic>;
    // print(user["history"]);
    // print("helooooooooooooooooooooooooooo");
    // DocumentReference doc = FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(authController.displayUserEmail.value);
    //
    // List<dynamic> x = docData["history"];
    try {
      if (user["history"].contains(videoId)) {
        user["history"].remove(videoId);
        user["history"].add(videoId);
        MongoDatabase.userCollection.update(where.eq("email",authController.displayUserEmail.value),modify.set("history",user["history"]));

        // doc.update({"history": user["history"]});
        return print('video already added to user history');
      } else {
        user["history"].add(videoId);
        MongoDatabase.userCollection.update(where.eq("email",authController.displayUserEmail.value),modify.set("history",user["history"]));

        // doc.update({"history": user["history"]});
      }
    } catch (e) {
      print(e);
    }
  }
}
