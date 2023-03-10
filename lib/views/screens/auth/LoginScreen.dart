import 'package:sizer/sizer.dart';
import 'package:youtube/logic/controllers/auth/AuthController.dart';
import 'package:youtube/routes/Routes.dart';
import 'package:youtube/utils/TextUtils.dart';
import 'package:youtube/utils/Theme.dart';
import 'package:youtube/views/widgets/auth/IconWidget.dart';
import 'package:youtube/views/widgets/auth/LoginEmailForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 154, bottom: 363, right: 45, left: 55),
        child: Column(children: [
          TextUtils(
            text: "Login by",
            color: labalColor,
            fontWeight: FontWeight.normal,
            fontsize: 11.sp,
            underLine: TextDecoration.none,
          ),
          SizedBox(
            height: 5.8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<AuthController>(builder: (_) {
                return IconWidget(
                  conternierColor: conternierColor,
                  onPressed: () {
                    controller.loginUsinggoogle();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                  image: 'assets/images/image 14google.png',
                  textUtils: "with Google",
                );
              }),
              SizedBox(
                width: 5.08.w,
              ),
              IconWidget(
                conternierColor: Colors.black,
                onPressed: () {
                  Get.offNamed(Routes.mainScreen);
                },
                image: 'assets/images/image 16Apple.png',
                textUtils: "Skip",
              ),
            ],
          ),
          SizedBox(
            height: 7.04.h,
          ),
          TextUtils(
              text: "or",
              color: labalColor,
              fontWeight: FontWeight.normal,
              fontsize: 11.sp,
              underLine: TextDecoration.none),
          SizedBox(
            height: 2.34.h,
          ),
          Container(
            height: 4.69.h,
            child: TabBar(
                controller: controller.tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: labalColor,
                tabs: [
                  Tab(
                    child: Text("Email", style: TextStyle(fontSize: 12.sp)),
                  ),

                ]),
          ),
          Container(
            height: 46.60.h,
            child: TabBarView(
                controller: controller.tabController,
                children: [Login_Email_Form()]),
          ),
        ]),
      ),
    );
  }
}
