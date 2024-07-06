// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/custom_order_list.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/clinic_staff/clinic_staff_view_model.dart';
import 'package:pickmed/ui/screens/order_detail/order_detail_screen.dart';
import 'package:provider/provider.dart';

class ClientStaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClientStaffViewModel(),
      child: Consumer<ClientStaffViewModel>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            // progressIndicator: CustomLoader(),

            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: _appBar(context),

              ///
              /// Body
              ///
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order List",
                      style: style22.copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///
                    /// List Data of Orders
                    ///

                    Expanded(
                      child: ListView.builder(
                        itemCount: model.orders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              var result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderDetailScreen(
                                      orderList: model.orders[index]),
                                ),
                              );
                              if (result != null && result == true) {
                                model
                                    .getOrderList(); // Refresh order list if status changed
                              }
                            },
                            child: CustomOrderList(
                              orders: model.orders[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_appBar(context) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
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
