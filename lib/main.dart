// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/ui/screens/splash_screen.dart';

import 'locator.dart';

void main() async {
  // await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: backgoundColor,
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent)
            // useMaterial3: true,
            ),
        home: const SplashScreen(),
      ),
    );
  }
}
