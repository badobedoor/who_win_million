import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

class UsingTheCrowd extends StatelessWidget {
  const UsingTheCrowd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double hightcorct = 101;
    // double hightwo = 22;
    // double hightthree = 23;
    // double hightfour = 24;
    // void getrandomNumber() {
    //   var rng = Random();
    //   int courectanser = rng.nextInt(5) + 55;
    //   var two = rng.nextInt(100 - courectanser) + 1;
    //   var three = rng.nextInt(100 - (courectanser + two)) + 1;
    //   var four = 100 - (courectanser + two + three);

    //   setState(() {
    //     hightcorct = courectanser * 1.7;
    //     hightwo = two * 1.7;
    //     hightthree = three * 1.7;
    //     hightfour = four * 1.7;
    //   });
    // }
    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 340,
        height: 234,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          20.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: 22.h,
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: 35.h,
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: 101.h,
                width: 45.w,
                color: MyColors.darkGreen,
              ),
            ],
          ),
          // سطر عادى
          Container(
            height: 1.h,
            width: 240.w,
            color: MyColors.darkGreen,
          ),
          5.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalText(
                text: "1",
                color: MyColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
              55.horizontalSpace,
              NormalText(
                text: "2",
                color: MyColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
              55.horizontalSpace,
              NormalText(
                text: "3",
                color: MyColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
              55.horizontalSpace,
              NormalText(
                text: "4",
                color: MyColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
            ],
          ),
          20.verticalSpace,
          LinearButton(
            ontap: () {
              // getrandomNumber();
            },
            width: 103,
            height: 40,
            borderRadius: 10,
            child: NormalText(
              text: "تم",
              color: MyColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ]),
      ),
    );
  }
}
