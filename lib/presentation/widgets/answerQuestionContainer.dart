import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/my_colors.dart';
import 'NormalText.dart';
import 'containerWithLinearGradient.dart';

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
