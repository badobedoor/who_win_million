import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../business_logic/provider/variablesProvider.dart';
import '../../constants/my_colors.dart';
import 'NormalText.dart';
import 'containerWithLinearGradient.dart';
import 'linear_button.dart';

class UsingTheCrowd extends StatefulWidget {
  const UsingTheCrowd({
    Key? key,
  }) : super(key: key);

  @override
  State<UsingTheCrowd> createState() => _UsingTheCrowdState();
}

class _UsingTheCrowdState extends State<UsingTheCrowd> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getrandomNumber();
  }

  double hightCorrectAnswerRang = 5;
  double hightfristAnswerRang = 5;
  double hightSecondAnswerRang = 5;
  double hightThirdAnswerRang = 5;
  double hightFourthAnswerRang = 5;

  void getrandomNumber() {
    var rng = Random();
    int correctAnswerRang = rng.nextInt(5) + 55;
    var fristAnswerRang = 5;
    var secondAnswerRang = rng.nextInt(100 - correctAnswerRang) + 1;
    var thirdAnswerRang =
        rng.nextInt(100 - (correctAnswerRang + secondAnswerRang)) + 1;
    var fourthAnswerRang =
        100 - (correctAnswerRang + secondAnswerRang + thirdAnswerRang);
    setState(() {
      hightCorrectAnswerRang = correctAnswerRang * 1.7;
      hightfristAnswerRang = fristAnswerRang * 1.7;
      hightSecondAnswerRang = secondAnswerRang * 1.7;
      hightThirdAnswerRang = thirdAnswerRang * 1.7;
      hightFourthAnswerRang = fourthAnswerRang * 1.7;
    });
  }

  @override
  Widget build(BuildContext context) {
    var question =
        Provider.of<VariablesProvider>(context, listen: true).question;
    var correctAnswer =
        Provider.of<VariablesProvider>(context, listen: true).correctAnswer;
    double gethight(int answerNumber) {
      var correctAnswerNumber = int.parse('$correctAnswer');
      if (correctAnswerNumber == answerNumber) {
        return hightCorrectAnswerRang;
      } else if (answerNumber == 1) {
        return hightfristAnswerRang;
      } else if (answerNumber == 2) {
        return hightSecondAnswerRang;
      } else if (answerNumber == 3) {
        return hightThirdAnswerRang;
      } else {
        return hightFourthAnswerRang;
      }
    }

    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 340,
        height: 234,
        border: 3,
        borderRadius: 13,
        child: Column(children: [
          35.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: gethight(1),
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: gethight(2),
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: gethight(3),
                width: 45.w,
                color: MyColors.darkGreen,
              ),
              20.horizontalSpace,
              Container(
                height: gethight(4),
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
              Provider.of<VariablesProvider>(context, listen: false)
                  .set_UsingTheCrowdContainerShow(false);
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
