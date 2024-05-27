import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myCenter extends StatefulWidget {
  const myCenter({super.key});

  @override
  State<myCenter> createState() => _myCenterState();
}

class _myCenterState extends State<myCenter> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 750.w,
      height: ScreenUtil().screenHeight,
      color: Colors.white,
      child: const Center(
        child: Text("我的"),
      ),
    );
  }
}
