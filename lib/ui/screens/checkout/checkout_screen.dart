import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/checkout/checkout_view_model.dart';
import 'package:pickmed/ui/screens/order_status/order_status_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => CheckoutViewModel(),
      child: Consumer<CheckoutViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: _appBar(context),

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 20),
              child: Column(
                children: [
                  ///
                  /// NAME
                  ///
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: blackColor.withOpacity(0.04),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 5))
                    ]),
                    child: TextFormField(
                      controller: model.nameController,
                      decoration: authFieldDecoration.copyWith(
                          hintText: 'UserName',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text('Name : ', style: style18),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "$staticAssets/edit.png",
                              scale: 4,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Phone NO
                  ///
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: blackColor.withOpacity(0.04),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 5))
                    ]),
                    child: TextFormField(
                      controller: model.PhoneController,
                      decoration: authFieldDecoration.copyWith(
                          hintText: '013 - 456789',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text('Phone Number : ', style: style18),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "$staticAssets/edit.png",
                              scale: 4,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Product List
                  ///
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                              color: blackColor.withOpacity(0.04),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Product List :', style: style18),
                        SizedBox(
                          height: 10.h,
                        ),
                        medicineNameAndPrice(
                            title: '1  X  Cap. Celebrex', price: 'RM 40.00'),
                        medicineNameAndPrice(
                            title: '1  X  Cap. Tramadol', price: 'RM 20.00'),
                        medicineNameAndPrice(
                            title: '1  X  Tab. Ibuprofen', price: 'RM 10.00'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Payment
                  ///
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                              color: blackColor.withOpacity(0.04),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payment (RM) :',
                          style: style18.copyWith(
                              fontWeight: FontWeight.w800, fontSize: 16.sp),
                        ),
                        Text(
                          'RM 70.00',
                          style: style18.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          ///
          /// Button
          ///
          bottomSheet: Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              children: [
                payButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderStatusScreen()));
                })
              ],
            ),
          ),
        ),
      ),
    );
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
      'Checkout',
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

medicineNameAndPrice({title, price}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title',
          style: style18.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
        Text(
          '$price',
          style: style18.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
        ),
      ],
    ),
  );
}

payButton({onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
          color: const Color(0xff4013BD),
          borderRadius: BorderRadius.circular(35.r)),
      child: Text(
        'Pay',
        style: style18.copyWith(color: whiteColor),
      ),
    ),
  );
}
