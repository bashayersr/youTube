import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/Home/components/custom_appbar.dart';
import 'package:youtube_clone_app/Home/components/video_widget.dart';
import 'package:youtube_clone_app/Home/controller/getx_controller.dart';

class Explore extends StatelessWidget {
  Explore({Key key}) : super(key: key);
  final GetxVedController controller = Get.put(GetxVedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
        ],
      ),
    );
  }
}
