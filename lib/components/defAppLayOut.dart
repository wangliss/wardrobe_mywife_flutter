import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class defAppLayOut extends StatelessWidget {
  final String appBarTitle;
  final Widget bodyWidget;
  final bool showNavBack;
  final List<Widget>? navActions;
  const defAppLayOut(
      {super.key,
      required this.appBarTitle,
      required this.bodyWidget,
      required this.showNavBack,
      this.navActions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: showNavBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Get.back();
                },
              )
            : SizedBox.shrink(),
        primary: true,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 38.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: navActions,
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.white70,
        child: bodyWidget,
      ),
    );
  }
}
