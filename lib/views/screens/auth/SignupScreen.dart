import 'package:youtube/logic/controllers/auth/AuthController.dart';
import 'package:youtube/utils/TextUtils.dart';
import 'package:youtube/utils/Theme.dart';
import 'package:youtube/views/widgets/auth/IconWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/auth/SignUpEmailForm.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 90, bottom: 363, right: 40, left: 50),
          child: Column(
            children: [
              TextUtils(
                  text: 'Sign Up by',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 3.7.h,
              ),
              Row(
                children: [
                  GetBuilder<AuthController>(builder: (_) {
                    return IconWidget(
                      conternierColor: googleColor,
                      onPressed: () async {
                        await controller.loginUsinggoogle();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );

                      },
                      textUtils: 'with Google',
                      image: 'assets/images/image 14google.png',
                    );
                  }),

                ],
              ),
              SizedBox(
                height: 6.3.h,
              ),
              TextUtils(
                  text: 'or',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.normal,
                  color: mainColor,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 2.3.h,
              ),
              Container(
                height: 40,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: mainColor,
                  tabs: [
                    Tab(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 650,
                child:
                    TabBarView(controller: controller.tabController, children: [
                  SignUp_Email_Form(),

                ]),
              )
            ],
          ), // end page
        ),
      ),
    );
  }
}
