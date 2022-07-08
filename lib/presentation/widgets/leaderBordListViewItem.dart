import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';

import 'containerWithLinearGradient.dart';

class ListViewItem extends StatelessWidget {
  final Color? color;
  const ListViewItem({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 15.w,
            child: Text(
              '.1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: color ?? MyColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 140.w,
            child: Text(
              'اسم المتسابق',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          LinearContainer(
            width: 165,
            height: 35,
            // borderRadius: 6,
            child: Text(
              ' 50254 نقطة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
