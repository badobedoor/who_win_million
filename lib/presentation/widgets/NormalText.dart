import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
    required this.text,
    required this.color,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 14.5.sp,
        color: color ?? MyColors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

class NormalTextWithBackGround extends StatelessWidget {
  final String text;
  final Color? color;
  bool? current_number;
  NormalTextWithBackGround({
    Key? key,
    required this.text,
    this.color,
    this.current_number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    current_number = this.current_number ?? false;
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              current_number!
                  ? MyColors.green
                  : MyColors.black.withOpacity(0.0),
              current_number!
                  ? MyColors.green.withOpacity(.10)
                  : MyColors.black.withOpacity(0.0)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.001, 1],
            tileMode: TileMode.clamp),
      ),
      child: NormalText(text: text, color: color),
    );
  }
}
