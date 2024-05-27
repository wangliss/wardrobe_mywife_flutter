import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:wardrobe_flutter/pages/home.dart';
import 'package:wardrobe_flutter/pages/myCenter.dart';
import 'package:wardrobe_flutter/pages/wardrobe.dart';

class index extends StatefulWidget {
  const index({super.key});

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
    wardrobe(),
    myCenter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 2.w,
              activeColor: const Color(0xffFE7E26),
              iconSize: 45.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              textStyle: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w400,
                color:  const Color(0xffFE7E26),
              ),
              tabs:const [
                GButton(
                  icon:LineIcons.boxOpen,
                  text: '衣橱',
                ),
                GButton(
                  icon: LineIcons.personEnteringBooth,
                  text: '搭配',
                ),
                GButton(
                  icon: LineIcons.grinningWinkingFace,
                  text: '我的',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
