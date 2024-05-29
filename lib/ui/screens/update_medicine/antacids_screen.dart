// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_detail/medicine_screen.dart';
import 'package:pickmed/ui/screens/update_medicine/allergry_provider.dart';
import 'package:provider/provider.dart';

class AntacidsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => AllergyProvider(),
      child: Consumer<AllergyProvider>(
        builder: (context, model, child) => Scaffold(
          /// App Bar
          ///
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),

          ///
          /// Start Body
          ///
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Back Button and Title
                ///

                Text('Antacids',
                    style: style22.copyWith(fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.medicinelist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicineDetailScreen(
                                medicineType: model.medicinelist[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ///
                                /// Image
                                ///
                                Container(
                                  height: 120.h,
                                  width: 200.w,
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
                                          image: AssetImage(
                                              '$dynamicAssets/${model.medicinelist[index].imgUrl}.png'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  '${model.medicinelist[index].medicineName}',
                                  style: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
