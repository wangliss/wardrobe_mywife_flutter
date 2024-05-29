import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wardrobe_flutter/components/defBtn.dart';

import '../routes/app_routes.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //进行登录
  void toLogin() async {
    EasyLoading.show();
    await Future.delayed(const Duration(milliseconds: 1000));
    EasyLoading.dismiss();
    EasyLoading.showSuccess("登录成功");
    await Future.delayed(const Duration(milliseconds: 300));
    Get.toNamed(Routes.Index);
  }

  //忘记密码
  void showForgetPassword() {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      titleStyle:  TextStyle(fontSize: 34.sp),
      title: "温馨提示",
      middleText: "忘记登录密码请联系开发人员。。。",
      confirm: SizedBox(
        width: 200.w,
        height: 70.w,
        child: defBtn(
          onTap: () {
            Get.back();
          },
          title: '好的',
          textSize: 28.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFEAD3B),
              Color(0xffFE7E26),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 300.w,
              child: Center(
                child: Image.asset(
                  "assets/images/startLog.png",
                  width: 388.w,
                  height: 399.w,
                ),
              ).animate().fadeIn(delay: 300.ms, duration: 700.ms),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 750.w,
                height: 650.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100.w),
                    topRight: Radius.circular(100.w),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 488.w,
                      height: 140.w,
                      margin: EdgeInsets.only(top: 65.w),
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                            hintText: "请输入用户名",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person_2)),
                      ),
                    ),
                    SizedBox(
                      width: 488.w,
                      height: 140.w,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true, // 设置输入类型为密码
                        controller: userPasswordController,
                        decoration: const InputDecoration(
                            hintText: "请输入密码",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock)),
                      ),
                    ),
                    Container(
                      width: 488.w,
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          showForgetPassword();
                        },
                        child: Text(
                          "忘记密码了？",
                          style:
                              TextStyle(color: Colors.amber, fontSize: 28.sp),
                        ),
                      ),
                    ),
                    Container(
                      width: 488.w,
                      height: 100.w,
                      margin: EdgeInsets.only(top: 40.w),
                      child: defBtn(
                        title: "登录",
                        textSize: 38.sp,
                        onTap: () {
                          toLogin();
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
