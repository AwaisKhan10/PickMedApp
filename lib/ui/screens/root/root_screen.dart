import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/ui/custom_widgets/bottom_navigator_bar.dart';
import 'package:pickmed/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;

  const RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenViewModel(selectedScreen),
      child: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgoundColor,
          body: model.allScreen[model.selectedScreen],
          //  /
          /// Bottom Bar
          //    /
          bottomNavigationBar: _bottomAppbar(model),
        ),
      ),
    );
  }
}

Widget _bottomAppbar(RootScreenViewModel model) {
  return BottomAppBar(
    height: 100.h,
    elevation: 0.0,
    color: whiteColor,
    // shape: const CircularNotchedRectangle(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///
                /// Home Image
                ///
                ///

                CustomBottomNavigarBar(
                    image: "$staticAssets/home.png",
                    onTap: () {
                      model.updatedScreen(0);
                    },
                    currentIndex: model.selectedScreen,
                    indexNumber: 0),

                ///
                /// Cart
                ///
                CustomBottomNavigarBar(
                    image: "$staticAssets/shopping-cart.png",
                    onTap: () {
                      model.updatedScreen(1);
                    },
                    currentIndex: model.selectedScreen,
                    indexNumber: 1),

                CustomBottomNavigarBar(
                    image: "$staticAssets/profile_img.png",
                    onTap: () {
                      model.updatedScreen(2);
                    },
                    scale: 5.0,
                    currentIndex: model.selectedScreen,
                    indexNumber: 1),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
