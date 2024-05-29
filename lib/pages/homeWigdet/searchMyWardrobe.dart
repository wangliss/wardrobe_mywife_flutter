import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/defAppLayOut.dart';

class searchMyWardrobe extends StatefulWidget {
  const searchMyWardrobe({super.key});

  @override
  State<searchMyWardrobe> createState() => _searchMyWardrobeState();
}

class _searchMyWardrobeState extends State<searchMyWardrobe> {
  @override
  Widget build(BuildContext context) {
    return defAppLayOut(
      appBarTitle: "搜索",
      showNavBack: true,
      bodyWidget: Container(),
    );
  }
}
