// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:who_win_million/presentation/widgets/container_with_background_image.dart';
import 'package:who_win_million/presentation/widgets/helpCenterContainer.dart';

import 'package:who_win_million/presentation/widgets/questionCenterContainer.dart';

import 'package:who_win_million/presentation/widgets/scoreCenterContainer.dart';

import '../../business_logic/help/soundEffects.dart';
import '../widgets/blackScreenWithOpacity.dart';
import '../widgets/endGameAlert.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();

  // note: updated as context.ancestorStateOfType is now deprecated
  static _QuestionsScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_QuestionsScreenState>();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<List<Object>> allScore = [];
  bool endGameAlertShow = false;
  String gameEndScoreText = '0';
  set allScoreDataChange(List<List<Object>> value) =>
      setState(() => allScore = value);
  set gameEndAlertShow(bool gameEndValue) =>
      setState(() => endGameAlertShow = gameEndValue);
  set gameEndScoreTextValueShange(String gameEndScoreTextValue) =>
      setState(() => gameEndScoreText = gameEndScoreTextValue);
  @override
  void initState() {
    super.initState();
    SoundEffects.setAndPlaystartgameAudio()
        .whenComplete(() => SoundEffects.setAndPlayQuestionsEseyAudio());
    setAllScore();
  }

  void setAllScore() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    allScore = [
      [100, true],
      [200, false],
      [300, false],
      [400, false],
      [500, false],
      [myFormat.format(1000), false],
      [myFormat.format(2000), false],
      [myFormat.format(4000), false],
      [myFormat.format(8000), false],
      [myFormat.format(16000), false],
      [myFormat.format(32000), false],
      [myFormat.format(64000), false],
      [myFormat.format(128000), false],
      [myFormat.format(250000), false],
      [myFormat.format(500000), false],
      [myFormat.format(750000), false],
      [myFormat.format(1000000), false],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainerWithBackgroundImage(
            child: Row(
              children: [
                // Score Center Container
                ScoreCenterContainer(allScore: allScore),

                Padding(
                  padding: EdgeInsets.only(right: 34.w, left: 40.w, top: 28.h),
                  child: Column(
                    children: [
                      //Help Center منطقه وسائل المساعدة
                      const HelpCenterContainer(),
                      92.verticalSpace,
                      //Question Centerمنطقه الاسائله واجابتها
                      QuestionCenterContainer(allScore: allScore),
                    ],
                  ),
                )
              ],
            ),
          ),
          // خللفية شفافة سوداء
          if (endGameAlertShow) BlackScreenWithOpacity(),

          //Using the crowd  وسيلة مساعده الاستعانه بالجمهور
          //UsingTheCrowd(),

          // call a friend وسيلة مساعده الاتصال بصديق
          // CallFriend()

          //Quit the game الانسحاب
          //QuitTheGame(),

          // game over  انتهت اللعبه
          if (endGameAlertShow) EndGameAlert(scoreText: gameEndScoreText),
        ],
      ),
    );
  }
}
