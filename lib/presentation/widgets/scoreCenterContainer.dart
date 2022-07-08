import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';

class ScoreCenterContainer extends StatelessWidget {
  const ScoreCenterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 82.w,
      color: MyColors.black.withOpacity(0.6),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        NormalTextWithBackGround(text: '1.000.000', color: MyColors.yellow),
        NormalTextWithBackGround(text: '750.000'),
        NormalTextWithBackGround(text: '500.000'),
        NormalTextWithBackGround(text: '256.000'),
        NormalTextWithBackGround(text: '128.000'),
        NormalTextWithBackGround(text: '64.000', color: MyColors.yellow),
        NormalTextWithBackGround(text: '32.000'),
        NormalTextWithBackGround(text: '16.000'),
        NormalTextWithBackGround(text: '8.000', current_number: true),
        NormalTextWithBackGround(text: '4.000'),
        NormalTextWithBackGround(text: '3.000'),
        NormalTextWithBackGround(text: '2.000'),
        NormalTextWithBackGround(text: '1.000', color: MyColors.yellow),
        NormalTextWithBackGround(text: '500'),
        NormalTextWithBackGround(text: '400'),
        NormalTextWithBackGround(text: '300'),
        NormalTextWithBackGround(text: '200'),
        NormalTextWithBackGround(text: '100'),
      ]),
    );
  }
}
