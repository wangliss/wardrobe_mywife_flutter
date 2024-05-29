import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wardrobe_flutter/components/defBtn.dart';
import 'package:wardrobe_flutter/routes/app_routes.dart';

class startPage extends StatefulWidget {
  const startPage({super.key});

  @override
  State<startPage> createState() => _startPageState();
}

class startController extends GetxController {
  @override
  void onClose() {
    super.onClose();
  }
}

class _startPageState extends State<startPage> {
  @override
  void initState() {
    super.initState();
    checkFastUse();
  }

  final RxBool showStartView = true.obs;

  void checkFastUse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? fastUse = prefs.getBool('fastUse');
    await Future.delayed(const Duration(milliseconds: 1200));
    if(false){
      Get.toNamed(Routes.Index);
    }else{
      showStartView.value = false;
      await prefs.setBool('fastUse', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(startController());
    return Container(
      width: 750.w,
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
      child: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Visibility(
                visible: !showStartView.value,
                child: SizedBox(
                  width: 750.w,
                  height: ScreenUtil().screenHeight,
                  child: Image.asset(
                    "assets/images/startBg.png",
                    width: 750.w,
                    height: ScreenUtil().screenHeight,
                  ),
                ).animate().moveY(delay: 1.ms, duration: 900.ms),
              ),
            ),
            Positioned(
              top: 300.w,
              child: Center(
                child: Image.asset(
                  "assets/images/startLog.png",
                  width: 388.w,
                  height: 399.w,
                ),
              ).animate().fadeOut(delay: 1000.ms, duration: 1000.ms),
            ),
            Positioned(
              bottom: 20.w,
              child: Visibility(
                visible: !showStartView.value,
                child: fastStartTipContainer()
                    .animate()
                    .fadeIn(delay: 1.ms, duration: 1000.ms),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container fastStartTipContainer() {
    return Container(
      width: 652.w,
      padding: EdgeInsets.only(top: 40.w, bottom: 40.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "开始整理我的衣柜吧",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
            ),
          ),
          Container(
            width: 488.w,
            margin: EdgeInsets.only(top: 20.w),
            child: Text(
              "Contrary to popular belief, Lorem Ipsum is not simply random text. "
              "It has roots in a piece of classical Latin literature.",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            width: 488.w,
            height: 100.w,
            margin: EdgeInsets.only(top: 25.w),
            child: defBtn(
              title: "GO! GO !GO!",
              onTap: () {
                Get.toNamed(Routes.login);
              },
            ),
          )
        ],
      ),
    );
  }
}
