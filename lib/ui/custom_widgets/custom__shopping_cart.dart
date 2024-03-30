import 'package:flutter/material.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/model/shopping_cart.dart';

class CustomCartContainer extends StatelessWidget {
  final ShoppingCart shoppingCart;
  final int index;
  final Function(int) onAdd;
  final Function(int) onMinimize;
  final Function(int) onRemove; // Add this line

  CustomCartContainer({
    required this.shoppingCart,
    required this.index,
    required this.onAdd,
    required this.onMinimize,
    required this.onRemove, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Section
          Row(
            children: [
              Container(
                height: 63.h,
                width: 92.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image:
                        AssetImage('$dynamicAssets/${shoppingCart.imgUrl}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${shoppingCart.title}',
                    style: style14.copyWith(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          onMinimize(index);
                        },
                        child: Image.asset(
                          "$staticAssets/minimize.png",
                          scale: 4,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '${shoppingCart.quantity}', // Use quantity from shopping cart
                        style: style14.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          onAdd(index);
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  onRemove(index); // Call removeItem method
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.asset(
                    "$staticAssets/remove.png",
                    scale: 3.5,
                  ),
                ),
              ),
              Text(
                'RM ${shoppingCart.rm}',
                style: style14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
