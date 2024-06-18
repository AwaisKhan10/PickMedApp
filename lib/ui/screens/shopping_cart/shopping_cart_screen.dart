import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/custom__shopping_cart.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/checkout/checkout_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/shopping_cart/shopping_cart_view_model.dart';
import 'package:provider/provider.dart';

class ShoppingCartcreen extends StatelessWidget {
  const ShoppingCartcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShoppingCartViewModel(),
        child: Consumer<ShoppingCartViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: _appBar(context),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: model.cartItems.isEmpty
                          ? model.state == ViewState.busy
                              ? SizedBox()
                              : const Center(
                                  child: Text("Your cart is empty!"),
                                )
                          : Stack(
                              // alignment: Alignment.bottomCenter,
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: model.cartItems.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 90.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD9D9D9),
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Image Section
                                          Row(
                                            children: [
                                              Container(
                                                height: 63.h,
                                                width: 92.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        '$dynamicAssets/img1.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    model.cartItems[index]
                                                            .productId?.title ??
                                                        "",
                                                    style: style14.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  SizedBox(height: 15.h),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          model.decrement(
                                                              index); // Call decrement method
                                                        },
                                                        child: Image.asset(
                                                          "$staticAssets/minimize.png",
                                                          scale: 4,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Text(
                                                        '${model.cartItems[index].cartQuantity}', // Use quantity from shopping cart
                                                        style: style14.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      InkWell(
                                                        onTap: () {
                                                          model
                                                              .increment(index);
                                                        },
                                                        child: Image.asset(
                                                          "$staticAssets/add.png",
                                                          scale: 4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),

                                          // Remove Icon Section
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  model.removeItem(index);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 6.0),
                                                  child: Image.asset(
                                                    "$staticAssets/remove.png",
                                                    scale: 3.5,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'RM ${model.cartItems[index].productId?.price ?? ""}',
                                                style: style14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );

                                    //  CustomCartContainer(
                                    //   cart: model.cartItems[index],
                                    //   index: index,
                                    //   onAdd: model.increment,
                                    //   onMinimize: model.decrement,
                                    //   onRemove: model.removeItem,
                                    // );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 20.h,
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 1,
                                  left: 1.sw / 2 - 0.6.sw / 2,
                                  child: Container(
                                    // height: MediaQuery.sizeOf(context).height * 0.25,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: 0.5.sw,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.r)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total',
                                                  style: style18,
                                                ),
                                                Text(
                                                  'RM ${model.totalPrice}',
                                                  style: style18,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        checkoutButton(onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckoutScreen()));
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    )
                  ],
                ),
              ),

              ///
              /// Bottom Sheet
              ///
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
      width: 0.5.sw,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      width: 0.5.sw,
      // margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
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
