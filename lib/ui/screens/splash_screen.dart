import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/ui/screens/root/root_screen.dart';
import 'package:pickmed/ui/screens/start_screen.dart';
import '../../core/services/local_storage.dart';
import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();
  // final _dbService = locator<DatabaseService>();
  final _localStorateService = locator<LocalStorageService>();
  // final _notificationService = locator<NotificationsService>();

  // @override
  // void didChangeDependencies() {
  //   _initialSetup();
  //   super.didChangeDependencies();
  // }

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 2));
    await _localStorateService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    // final connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult == ConnectivityResult.none) {
    //   Get.dialog(const NetworkErrorDialog());
    //   return;
    // }

    ////
    ///initializing notification services
    ///
    // await NotificationsService().initConfigure();
    // var fcm = await NotificationsService().getFcmToken();
    // print("FCM TOKEN is =====> $fcm");
    // await _notificationService.initConfigure();

    await _authService.doSetup();
    ////
    ///checking if the user is login or not
    ///
    debugPrint('Login State: ${_authService.isLogin}');
    if (_authService.isLogin) {
      Get.off(() => const RootScreen());
    } else {
      Get.off(() => const StartScreen());
    }

    // Get.off(() => const RootScreen());
  }

  @override
  void initState() {
    super.initState();
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return Scaffold(
      body: Center(
          child: Text(
        'Picked Me Loading ...',
        style: TextStyle(fontSize: 24.sp),
      )),
    );
  }
}
