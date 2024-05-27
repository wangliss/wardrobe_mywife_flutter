import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wardrobe_flutter/pages/startPage.dart';
import 'package:wardrobe_flutter/routes/app_routes.dart';
import 'package:wardrobe_flutter/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<void> requestPermissions() async {
    try {
      await Permission.storage.request();
      await Permission.camera.request();
    } catch (e) {
      print("请求权限错误：$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: requestPermissions(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return ScreenUtilInit(
          designSize: const Size(750, 1624),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              getPages: [
                GetPage(
                  participatesInRootNavigator: true,
                  name: Routes.Start,
                  page: () => const startPage(),
                ),
                GetPage(
                    name: Routes.Index,
                    page: () => const index(),
                    transition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 300)),
              ],
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              theme: ThemeData(
                // fontFamily: 'AlibabaHealthFont',
                fontFamily: 'pingfangfan',
                primarySwatch: Colors.orange, // 设置全局的主色调
                hintColor: Colors.orange, // 设置全局的强调色
                appBarTheme:const AppBarTheme(
                  color: Colors.white, // 设置AppBar的背景颜色
                ),
                buttonTheme: const ButtonThemeData(
                  buttonColor: Color(0xffFE7E26),// 设置按钮的背景颜色
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
