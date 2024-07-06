import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_detail/medicine_detail_view_model.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class MedicineDetailScreen extends StatelessWidget {
  final Medicine medicineType;

  const MedicineDetailScreen({super.key, required this.medicineType});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MedicineDetailViewModel(),
      child: Consumer<MedicineDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: _appBar(context),

          ///
          /// Start Body
          ///
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Back',
                        style: style18.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      medicineType.imageUrl != null
                          ? Container(
                              height: 148.h,
                              width: 303.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: blackColor.withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          medicineType.imageUrl ?? ''),
                                      //  AssetImage('$dynamicAssets/img2.png'),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              height: 148.h,
                              width: 303.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: blackColor.withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0)
                                  ],
                                  image: DecorationImage(
                                      image:
                                          AssetImage('$dynamicAssets/img2.png'),
                                      fit: BoxFit.cover)),
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        '${medicineType.title}',
                        style: style18.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 24),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'RM ${medicineType.price}',
                          style: style22.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' / ${medicineType.categroy}',
                          style: style22.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w400),
                        )
                      ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  thickness: 1,
                  color: blackColor.withOpacity(0.5),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  medicineType.description ?? '',
                  style: style18.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 16.sp),
                )
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Text(
                //   'Dose : 1 capsule / 2 times (a day) ',
                //   style: style18.copyWith(
                //       fontWeight: FontWeight.w400, fontSize: 16.sp),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Text(
                //   'Warning :\n        . Only for adult',
                //   style: style18.copyWith(
                //       fontWeight: FontWeight.w400, fontSize: 16.sp),
                // ),
              ],
            ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: InkWell(
            onTap: () {
              model.addToCart(medicineType.id ?? "");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ShoppingCartcreen(),
              //   ),
              // );
            },
            child: Container(
              width: 150.h,
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.only(left: 230, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: greenColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add to Cart',
                    style: style18.copyWith(color: whiteColor),
                  ),
                  Image.asset(
                    "$staticAssets/shopping-cart.png",
                    height: 20.h,
                    width: 20.w,
                    color: whiteColor,
                  ),
                ],
              ),
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
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: Image.asset(
        "$staticAssets/menu.png",
        scale: 3.5,
      ),
    ),
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
            scale: 2.5,
          ),
        ),
      ),
    ],
  );
}
