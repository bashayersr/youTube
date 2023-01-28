import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube/Home/components/custom_appbar.dart';
import 'package:youtube/Home/components/video_widget.dart';
import 'package:youtube/Home/controller/clean_cde.dart';
import 'package:youtube/Home/controller/youtube_search_controller.dart';
import 'package:youtube/routes.dart';

class Library extends StatelessWidget {
  Library({super.key});

  late SharedPreferences _profs;
  List<String> history = ["asdasd"];
  final YoutubeSearchController controller = Get.put(YoutubeSearchController());

  @override
  Widget build(BuildContext context) {


    return
      FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>("auth") == true ?
            Container(

                child: ListView(
                children: List.generate(controller.history.length, (index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text("${controller.history[index]}"),
                    ),
                  );
                }
                ),
            ),
            )

          :
      Center(child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.loginScreen);
        },
        child: Text("Please Login"),
      ));
  }
}
