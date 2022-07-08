import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';

import 'containerWithLinearGradient.dart';

class QuestionCenterContainer extends StatelessWidget {
  const QuestionCenterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 475.w,
      height: 174.h,
      child: Column(
        children: [
          LinearContainer(
            width: 475,
            height: 50,
            borderRadius: 10.r,
            child: Text(
              'نص السوال ؟',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: MyColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          24.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            children: [
              AnswerQuestionContainer(
                answerText: 'نص الجواب ؟',
                answerNumber: ":1",
                color: MyColors.lightGreen,
              ),
              25.horizontalSpace,
              AnswerQuestionContainer(
                answerText: 'نص الجواب ؟',
                answerNumber: ":2",
                color: MyColors.yellow,
              )
            ],
          ),
          20.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            children: [
              AnswerQuestionContainer(
                answerText: 'نص الجواب ؟',
                answerNumber: ":3",
                // color: MyColors.lightGreen,
              ),
              25.horizontalSpace,
              AnswerQuestionContainer(
                answerText: 'نص الجواب ؟',
                answerNumber: ":4",
                color: MyColors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnswerQuestionContainer extends StatelessWidget {
  const AnswerQuestionContainer({
    Key? key,
    this.color,
    required this.answerText,
    required this.answerNumber,
  }) : super(key: key);
  final Color? color;
  final String answerText;
  final String answerNumber;

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      color: color,
      width: 225,
      height: 40,
      borderRadius: 10.r,
      child: Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            NormalText(
              text: answerNumber,
              color: MyColors.green,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
            38.horizontalSpace,
            Text(
              answerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
