// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_back_button.dart';
import 'package:pickmed/ui/screens/add_medicin/add_medicin_provider.dart';
import 'package:pickmed/ui/screens/update_medicine/update/update_provider.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  final medId;

  const UpdateScreen({super.key, required this.medId});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UpdateProvider(medId),
        child: Consumer<UpdateProvider>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: AppBar(
                automaticallyImplyLeading: true,
              ),

              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 20, 0),
                child: Form(
                  key: model.formKey,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ///
                      /// Welcome User
                      // ///
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: CustomBackButton(
                      //     color: blackColor,
                      //   ),
                      // ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Update Medicine',
                            style:
                                style22.copyWith(fontWeight: FontWeight.w400)),
                        // TextSpan(
                        //     text: ' ${model.authService.userProfile.fullName}',
                        //     style: style22.copyWith(color: brownColor))
                      ])),
                      SizedBox(height: 30.h),

                      ///
                      /// Medicine Types
                      ///
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 25),
                              child: TextFormField(
                                style: style14,
                                onChanged: (value) {
                                  model.medicine.title = value;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "field Required";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: authFieldDecoration.copyWith(
                                    hintText: 'Medicine Name'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 10.verticalSpace,
                      // Container(
                      //   // margin: EdgeInsets.symmetric(horizontal: 20),
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   decoration: BoxDecoration(
                      //       color: whiteColor,
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(
                      //           color: Color(0xff828282), width: 0.6)),
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     child: DropdownButton<String>(
                      //       isExpanded: true,
                      //       underline: Container(),
                      //       style: style18.copyWith(
                      //           color: texfieldColor,
                      //           fontWeight: FontWeight.normal),
                      //       dropdownColor: whiteColor,
                      //       value: model.value,
                      //       icon: Icon(
                      //         Icons.arrow_forward_ios,
                      //         color: blackColor,
                      //         size: 15,
                      //       ),
                      //       onChanged: (val) {
                      //         model.selecttype(val);
                      //       },
                      //       items: model.items
                      //           .map(
                      //             (val) => DropdownMenuItem<String>(
                      //               value: val,
                      //               child: Text(
                      //                 val,
                      //               ),
                      //             ),
                      //           )
                      //           .toList(),
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 25),
                              child: TextFormField(
                                style: style14,
                                onChanged: (value) {
                                  model.medicine.price = value;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "field Required";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: authFieldDecoration.copyWith(
                                    hintText: 'Medicine Price'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 10.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 25),
                              child: TextFormField(
                                style: style14,
                                maxLines: 5,
                                onChanged: (value) {
                                  model.medicine.description = value;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "field Required";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: authFieldDecoration.copyWith(
                                    hintText: 'Medicine Details'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          if (model.formKey.currentState!.validate()) {
                            model.updateMadicine(context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xff4013BD),
                              borderRadius: BorderRadius.circular(35.r)),
                          child: Text(
                            'Update Medicine',
                            style: style18.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
