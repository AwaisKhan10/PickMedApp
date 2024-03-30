import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/custom__shopping_cart.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/shopping_cart/shopping_cart_view_model.dart';
import 'package:provider/provider.dart';

class ShoppingCartcreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShoppingCartViewModel(),
        child: Consumer<ShoppingCartViewModel>(
          builder: (context, model, child) => Scaffold(
            ///
            /// App Bar
            ///
            appBar: _appBar(context),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: model.shoppingCartList.length,
                      itemBuilder: (context, index) {
                        return CustomCartContainer(
                          shoppingCart: model.shoppingCartList[index],
                          index: index,
                          onAdd: model.increment,
                          onMinimize: model.decrement,
                          onRemove: model.removeItem,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            ///
            /// Bottom Sheet
            ///

            bottomSheet: Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  boxContainerTotal(onPressed: () {}),
                  SizedBox(
                    height: 20.h,
                  ),
                  checkoutButton(onPressed: () {}),
                ],
              ),
            ),
          ),
        ));
  }
}

_appBar(context) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Image.asset(
        "$staticAssets/menu.png",
        scale: 3.5,
      ),
    ),
    title: Text(
      'Medicine Bag',
      style: style22,
    ),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image.asset(
            "$staticAssets/logout.png",
            scale: 3,
          ),
        ),
      ),
    ],
  );
}

boxContainerTotal({onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: style18,
          ),
          Text(
            'RM 70.00',
            style: style18,
          )
        ],
      ),
    ),
  );
}

checkoutButton({onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '',
            style: style14,
          ),
          Text(
            'Checkout',
            style: style18.copyWith(color: whiteColor),
          ),
          Icon(
            Icons.arrow_forward,
            size: 26.sp,
            color: whiteColor.withOpacity(0.50),
          )
        ],
      ),
    ),
  );
}
