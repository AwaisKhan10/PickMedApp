// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StepperComponent(
                  title: 'In Progress',
                  currentIndex: _currentIndex,
                  index: 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    _pageController.jumpToPage(0);
                  },
                ),
                StepperComponent(
                  title: 'Complete',
                  currentIndex: _currentIndex,
                  index: 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    _pageController.jumpToPage(1);
                  },
                ),
                StepperComponent(
                  title: 'Reject',
                  currentIndex: _currentIndex,
                  index: 2,
                  isLast: true,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                    _pageController.jumpToPage(3);
                  },
                ),
              ],
            ),
            // Expanded(
            //     child: PageView.builder(
            //         //only scroll with bubbles
            //         physics: NeverScrollableScrollPhysics(),
            //         controller: _pageController,
            //         itemCount: 4,
            //         itemBuilder: (context, index) {
            //           return Center(
            //             child: Text('Page ${index}'),
            //           );
            //         })),
          ],
        ),
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  // index describe the position of our bubble
  int index;
  //currentIndex is index that is gonna change on Tap
  int currentIndex;
  //onTap CallBack
  VoidCallback onTap;
  String? title;

  bool isLast;
  StepperComponent({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //now let's remove the ligne at the end of the row but also we need to remove unnecessary padding thus we need to remove the expanded
    //widget
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //index+1 we dont wanna show 0 in the screen since our index will start at 0
          Text(
            '$title',
            style: style14.copyWith(
                color: index == currentIndex ? greenColor : lightBlueColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //this is the bubble
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 15,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == currentIndex ? greenColor : lightBlueColor,
                    border: Border.all(
                        color: index == currentIndex
                            ? greenColor
                            : lightBlueColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              isLast == false
                  ? //this the ligne
                  const Expanded(
                      child: Divider(
                      thickness: 6,
                      color: greyColor,
                    ))
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
