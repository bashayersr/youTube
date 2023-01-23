import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/home/controllers/main_controller.dart';
import 'package:youtube/home/screen/home_screen.dart';
import 'package:youtube/home/screen/home_screen.dart';
import '../../routes/rout.dart';
import 'home_screen.dart';
import 'home_screen.dart';
import 'home_screen.dart';

//this main-screen containe appbar and bootom navbar
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(
      () {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Image.asset(
                'images/age-5.png',
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cast,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey,
                  )),
            ],
            backgroundColor: Colors.white,
            // title: Text(
            //   "YouTupe",
            // ),
          ),

          // backgroundColor: Colors.red,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            // unselectedItemColor: Colors.blue,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              // ignore: prefer_const_constructors

              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   activeIcon: Icon(
              //     Icons.search,
              //     color: Colors.black,
              //   ),
              //   icon: Icon(
              //     Icons.search,
              //     color: Colors.black,
              //   ),
              //   label: 'Home',
              // ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.subscriptions_rounded,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.subscriptions_outlined,
                  color: Colors.black,
                ),
                label: 'Subscriptions',
              ),

              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.video_library_rounded,
                  color: Colors.black,
                ),
                icon: Icon(
                  Icons.video_library_outlined,
                  color: Colors.black,
                ),
                label: 'Library',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      },
    ));
  }
}
