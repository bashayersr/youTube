import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/Home/components/custom_appbar.dart';
import 'package:youtube/Home/components/video_widget.dart';
import 'package:youtube/Home/controller/explor_controller.dart';
import 'package:youtube/Home/controller/getx_controller.dart';

class Explore extends StatelessWidget {
  Explore({super.key});
  //final GetxVedController controller = Get.put(GetxVedController());
  final ExploreController exploreController = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // CustomScrollView(
          //   controller: controller.scrollController,
          //   slivers: [
          //     SliverAppBar(
          //       backgroundColor: Colors.white,
          //       title: CustomAppBar(),
          //       floating: true,
          //       snap: true,
          //     ),
          //   ],
          // ),

          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser?.email)
                .collection("videohistory")
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    final data = docs[i].data();
                    return Image.network(
                        'https://www.googleapis.com/youtube/v3/videos?part=statistics&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&id=${data['videoId']}');

                    // ListTile(
                    //   // title: Text(data['videoId']),
                    //   title: Text(
                    //       'https://www.googleapis.com/youtube/v3/videos?part=statistics&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&id=${data['videoId']}'),
                    // );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
