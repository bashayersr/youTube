import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/components/custom_appbar.dart';
import 'package:youtube/Home/components/video_widget.dart';
import 'package:youtube/Home/controller/dartVd.dart';

class Subsecribtion extends StatelessWidget {
  Subsecribtion({super.key});

  // final DartVidController controller = Get.put(DartVidController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(child: Text('subsecribtion')),
    );
  }
}
