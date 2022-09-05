// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';

class ScoreCenterContainer extends StatelessWidget {
  List<List<Object>> allScore;
  ScoreCenterContainer({
    Key? key,
    required this.allScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 82.w,
      color: MyColors.black.withOpacity(0.6),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        NormalTextWithBackGround(
            text: allScore[16][0].toString(),
            current_number: allScore[16][1] as bool),
        NormalTextWithBackGround(
            text: allScore[15][0].toString(),
            current_number: allScore[15][1] as bool),
        NormalTextWithBackGround(
            text: allScore[14][0].toString(),
            current_number: allScore[14][1] as bool),
        NormalTextWithBackGround(
            text: allScore[13][0].toString(),
            current_number: allScore[13][1] as bool),
        NormalTextWithBackGround(
            text: allScore[12][0].toString(),
            color: MyColors.yellow,
            current_number: allScore[12][1] as bool),
        NormalTextWithBackGround(
            text: allScore[11][0].toString(),
            current_number: allScore[11][1] as bool),
        NormalTextWithBackGround(
            text: allScore[10][0].toString(),
            current_number: allScore[10][1] as bool),
        NormalTextWithBackGround(
            text: allScore[9][0].toString(),
            current_number: allScore[9][1] as bool),
        NormalTextWithBackGround(
            text: allScore[8][0].toString(),
            current_number: allScore[8][1] as bool),
        NormalTextWithBackGround(
            text: allScore[7][0].toString(),
            current_number: allScore[7][1] as bool),
        NormalTextWithBackGround(
            text: allScore[6][0].toString(),
            current_number: allScore[6][1] as bool),
        NormalTextWithBackGround(
            text: allScore[5][0].toString(),
            color: MyColors.yellow,
            current_number: allScore[5][1] as bool),
        NormalTextWithBackGround(
            text: allScore[4][0].toString(),
            current_number: allScore[4][1] as bool),
        NormalTextWithBackGround(
            text: allScore[3][0].toString(),
            current_number: allScore[3][1] as bool),
        NormalTextWithBackGround(
            text: allScore[2][0].toString(),
            current_number: allScore[2][1] as bool),
        NormalTextWithBackGround(
            text: allScore[1][0].toString(),
            current_number: allScore[1][1] as bool),
        NormalTextWithBackGround(
            text: allScore[0][0].toString(),
            current_number: allScore[0][1] as bool),
      ]),
    );
  }
}
