import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class defBtn extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? elevation, textSize;
  final Color? textColor;
  final List<Color> btnBackGroundColor;
  defBtn({
    super.key,
    required this.title,
    this.elevation = 4,
    this.textColor = Colors.white,
    this.btnBackGroundColor = const [Color(0XFFFEAD3B), Color(0XFFFEAD3B)],
    this.textSize = 20.0, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 设置按钮圆角
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: btnBackGroundColor, // 渐变颜色
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          constraints: const BoxConstraints(),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
