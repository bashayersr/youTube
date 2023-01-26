import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/Home/components/custom_appbar.dart';
import 'package:youtube_clone_app/Home/components/video_widget.dart';
import 'package:youtube_clone_app/Home/controller/dartVd.dart';

class Subsecribtion extends StatelessWidget {
  Subsecribtion({Key? key}) : super(key: key);

  // final DartVidController controller = Get.put(DartVidController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text('subsecribtion')),
    );
  }
}
