import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  //添加按钮
  void sowAddDialog() {
    TextStyle itemStyle = TextStyle(
      color: Colors.black87,
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
    );
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350.w,
          padding: EdgeInsets.only(top: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "创建服饰",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  " 拍照添加",
                  style: itemStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  " 从相册添加",
                  style: itemStyle,
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: "12313131311231313131313112311231313131313112313131313131123112313131313131123131313131311231123131313131313131123112313131313131"
              .split("")
              .map((c) => SizedBox(width: 690.w,child: Text(c,style: TextStyle(fontSize: 60.sp),textAlign: TextAlign.center,),),)
              .toList(),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          sowAddDialog();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xffFE7E26)),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 55.sp,
        ),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      title: Text(
        "我的衣橱",
        style: TextStyle(
          color: Colors.black,
          fontSize: 38.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white70,
      automaticallyImplyLeading: false,
      primary: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.search,
                  size: 50.sp,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.more_horiz,
                  size: 50.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
