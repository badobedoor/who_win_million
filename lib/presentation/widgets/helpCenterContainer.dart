import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';

class HelpCenterContainer extends StatelessWidget {
  const HelpCenterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 475.w,
      height: 35.h,
      child: Row(
        children: [
          HelpsContainer(
            child: Icon(
              FontAwesomeIcons.phoneFlip,
              color: MyColors.white,
              size: 14.sp,
            ),
          ),
          17.horizontalSpace,
          HelpsContainer(
            child: Icon(
              FontAwesomeIcons.users,
              color: MyColors.white,
              size: 14.sp,
            ),
          ),
          30.horizontalSpace,
          Container(
            alignment: Alignment.center,
            width: 78.w,
            height: 34.h,
            decoration: BoxDecoration(
              color: MyColors.yellow,
              borderRadius: BorderRadius.circular(32.r),
              border: Border.all(color: MyColors.black),
              boxShadow: [
                BoxShadow(
                  color: MyColors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              '17',
              style: TextStyle(
                fontSize: 20.sp,
                color: MyColors.green,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          30.horizontalSpace,
          HelpsContainer(
            child: Text(
              '50 : 50',
              style: TextStyle(
                fontSize: 14.sp,
                color: MyColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          17.horizontalSpace,
          HelpsContainer(
            child: Text(
              'الانسحاب',
              style: TextStyle(
                fontSize: 14.sp,
                color: MyColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HelpsContainer extends StatelessWidget {
  final Widget child;
  const HelpsContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      width: 75,
      height: 35,
      borderRadius: 32.r,
      child: Container(
        alignment: Alignment.center,
        width: 73.w,
        height: 33.h,
        decoration: BoxDecoration(
          color: MyColors.green,
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
