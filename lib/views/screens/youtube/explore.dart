import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  Explore ({super.key});
  // final GetxVedController controller = Get.put(GetxVedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        // controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            title: Text("CustomAppBar()"),
            snap: true,
          ),
        ],
      ),
    );
  }
}
