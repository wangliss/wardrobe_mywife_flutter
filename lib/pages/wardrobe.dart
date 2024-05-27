import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wardrobe extends StatefulWidget {
  const wardrobe({super.key});

  @override
  State<wardrobe> createState() => _wardrobeState();
}

class _wardrobeState extends State<wardrobe> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      width: 750.w,
      height: ScreenUtil().screenHeight,
      color: Colors.white,
      child: const Center(
        child: Text("衣柜"),
      ),
    );
  }
}
