import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube/routes.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Container(

        child:   FirebaseAuth.instance.currentUser != null ||
            GetStorage().read<bool>("auth") == true
            ? Center(child: Text("LibraryScreen"))
            :Center(child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.loginScreen);
              },
            child: Text("Please Login"),
        ))

    );

  }
}
