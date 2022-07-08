// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/GameOver.dart';
import 'package:who_win_million/presentation/widgets/blackScreenWithOpacity.dart';
import 'package:who_win_million/presentation/widgets/callFriend.dart';
import 'package:who_win_million/presentation/widgets/container_with_background_image.dart';
import 'package:who_win_million/presentation/widgets/helpCenterContainer.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';
import 'package:who_win_million/presentation/widgets/questionCenterContainer.dart';
import 'package:who_win_million/presentation/widgets/quitTheGame.dart';
import 'package:who_win_million/presentation/widgets/scoreCenterContainer.dart';
import 'package:who_win_million/presentation/widgets/usingTheCrowd.dart';

import '../widgets/containerWithLinearGradient.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainerWithBackgroundImage(
            child: Row(
              children: [
                // Score Center Container
                ScoreCenterContainer(),

                Padding(
                  padding: EdgeInsets.only(right: 34.w, left: 40.w, top: 28.h),
                  child: Column(
                    children: [
                      //Help Center منطقه وسائل المساعدة
                      HelpCenterContainer(),
                      92.verticalSpace,
                      //Question Centerمنطقه الاسائله واجابتها
                      QuestionCenterContainer(),
                    ],
                  ),
                )
              ],
            ),
          ),
          // خللفية شفافة سوداء
          // BlackScreenWithOpacity(),

          //Using the crowd  وسيلة مساعده الاستعانه بالجمهور
          //UsingTheCrowd(),

          // call a friend وسيلة مساعده الاتصال بصديق
          // CallFriend()

          //Quit the game الانسحاب
          //QuitTheGame(),

          // game over  انتهت اللعبه
          //GameOver(),
        ],
      ),
    );
  }
}
