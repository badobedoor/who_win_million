import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/screens/questions_screen.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

class AccountSettingsContainer extends StatelessWidget {
  const AccountSettingsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 331,
        height: 254,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 23.h, left: 25.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Icon(
                  FontAwesomeIcons.check,
                  color: MyColors.yellow,
                  size: 19.sp,
                ),
                NormalText(
                  text: "إعدادات الحساب",
                  color: MyColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
                Icon(
                  FontAwesomeIcons.xmark,
                  color: MyColors.yellow,
                  size: 19.sp,
                ),
              ],
            ),
          ),
          25.verticalSpace,
          NormalText(
            text: "ansbedoor@gmail.com",
            color: MyColors.darkGreen,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ]),
            width: 169.w,
            height: 35.h,
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 6.h, right: 16.w, left: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: MyColors.darkGreen),
                  hintText: "الاسم",
                  label: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الاسم',
                      style: TextStyle(),
                    ),
                  ),
                  fillColor: MyColors.white),
            ),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.h,
                width: 70.w,
                color: MyColors.darkGreen,
              ),
              7.horizontalSpace,
              NormalText(
                text: "أو",
                color: MyColors.darkGreen,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              7.horizontalSpace,
              Container(
                height: 1.h,
                width: 70.w,
                color: MyColors.darkGreen,
              ),
            ],
          ),
          16.verticalSpace,
          LinearButton(
            ontap: () {},
            width: 169,
            height: 35,
            borderRadius: 10,
            child: NormalText(
              text: "تسجيل الخروج",
              color: MyColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]),
      ),
    );
  }
}
