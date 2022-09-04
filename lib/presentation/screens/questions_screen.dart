// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:who_win_million/constants/my_colors.dart';

import 'package:who_win_million/presentation/widgets/container_with_background_image.dart';
import 'package:who_win_million/presentation/widgets/helpCenterContainer.dart';

import 'package:who_win_million/presentation/widgets/questionCenterContainer.dart';

import 'package:who_win_million/presentation/widgets/scoreCenterContainer.dart';

import '../../business_logic/cubit/player_cubit.dart';
import '../../business_logic/cubit/questions_cubit.dart';
import '../../business_logic/functions.dart/question_screen_functions.dart';
import '../../business_logic/help/soundEffects.dart';
import '../../business_logic/help/staticValues.dart';
import '../../business_logic/provider/variablesProvider.dart';
import '../widgets/blackScreenWithOpacity.dart';
import '../widgets/callFriend.dart';
import '../widgets/endGameAlert.dart';
import '../widgets/fristquestionAlert.dart';
import '../widgets/playUsingTheCrowdAnimation.dart';
import '../widgets/quitTheGame.dart';
import '../widgets/usingTheCrowd.dart';

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
  // bool endGameAlertShow = false;
  // String gameEndScoreText = '0';
  // int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 20;
  // set endTimeChange(int newTime) => setState(() => newTime = endTime);
  set allScoreDataChange(List<List<Object>> value) =>
      setState(() => allScore = value);
  // set gameEndAlertShow(bool gameEndValue) =>
  //     setState(() => endGameAlertShow = gameEndValue);
  // set gameEndScoreTextValueShange(String gameEndScoreTextValue) =>
  //     setState(() => gameEndScoreText = gameEndScoreTextValue);
  void changeValue() {
    setState(() {
      // endGameAlertShow = true;
    });
  }

  // StopWatchTimer stopWatchTimer = StopWatchTimer();

  @override
  void initState() {
    super.initState();
    bool isSoundOn =
        Provider.of<VariablesProvider>(context, listen: false).isSoundOn;

    if (isSoundOn) {
      SoundEffects.setAndPlaystartgameAudio()
          .whenComplete(() => SoundEffects.setAndPlayQuestionsEseyAudio());
    }

    setAllScore();
    // stopWatchTimer = StopWatchTimer(
    //   mode: StopWatchMode.countDown,
    //   presetMillisecond:
    //       StopWatchTimer.getMilliSecFromSecond(60), // millisecond => minute.
    // );
    // stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var endGameAlertShow =
        Provider.of<VariablesProvider>(context, listen: false).endGameAlertShow;
    var nextQuestion =
        Provider.of<VariablesProvider>(context, listen: false).nextQuestion;
    if (endGameAlertShow == true) {
      // stopWatchTimer.dispose();
      // stopWatchTimer = StopWatchTimer(
      //   mode: StopWatchMode.countDown,
      //   presetMillisecond:
      //       StopWatchTimer.getMilliSecFromSecond(60), // millisecond => minute.
      // );
      // stopWatchTimer.onExecute.add(StopWatchExecute.start);
      // Provider.of<VariablesProvider>(context, listen: false)
      // .set_NextQuestion(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // var stopWatchTimer =
    //     Provider.of<VariablesProvider>(context, listen: false).stopWatchTimer;
    // stopWatchTimer.dispose();
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
    // StopWatchTimer stopWatchTimer = StopWatchTimer(
    //     mode: StopWatchMode.countDown,
    //     presetMillisecond: StopWatchTimer.getMilliSecFromSecond(40),
    //     onEnded: () {
    //       timeEndGameOver(context);
    //     });
    var stopWatchTimer =
        Provider.of<VariablesProvider>(context, listen: true).stopWatchTimer;
    var endGameAlertShow =
        Provider.of<VariablesProvider>(context, listen: true).endGameAlertShow;
    var quitGameAlertShow =
        Provider.of<VariablesProvider>(context, listen: true).quitGameAlertShow;
    var callFriendContainerShow =
        Provider.of<VariablesProvider>(context, listen: true)
            .callFriendContainerShow;
    var fristquestionAlertShow =
        Provider.of<VariablesProvider>(context, listen: true)
            .fristquestionAlertShow;
    var usingTheCrowdContainerShow =
        Provider.of<VariablesProvider>(context, listen: true)
            .usingTheCrowdContainerShow;
    // var allScore = allScoreloca
    //     ? Provider.of<VariablesProvider>(context, listen: true).allScore
    //     : allScorelocal;
    // Widget buildNoInternetWidget() {
    //   return Container(
    //     // 640×360 px
    //     height: 360.h,
    //     width: 640.w,
    //     decoration: const BoxDecoration(
    //       image: DecorationImage(
    //           image: AssetImage("assets/images/noConnection.png"),
    //           fit: BoxFit.fill),
    //     ),
    //   );
    // }

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
                      HelpCenterContainer(
                        allScore: allScore,
                        function: changeValue,
                        // stopWatchTimer: stopWatchTimer
                      ),
                      92.verticalSpace,
                      //Question Centerمنطقه الاسائله واجابتها
                      QuestionCenterContainer(
                        allScore: allScore,
                        function: changeValue,
                        // stopWatchTimer: stopWatchTimer
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // خللفية شفافة سوداء

          if (endGameAlertShow == true ||
              quitGameAlertShow == true ||
              fristquestionAlertShow == true ||
              usingTheCrowdContainerShow == true ||
              callFriendContainerShow == true)
            const BlackScreenWithOpacity(),

          //Using the crowd  وسيلة مساعده الاستعانه بالجمهور
          if (usingTheCrowdContainerShow == true) PlayUsingTheCrowdAnimation(),

          // call a friend وسيلة مساعده الاتصال بصديق
          if (callFriendContainerShow == true) const CallFriend(),

          //Quit the game الانسحاب
          if (quitGameAlertShow == true) const QuitTheGame(),

          // game over  انتهت اللعبه
          if (endGameAlertShow == true) const EndGameAlert(),
          //اظهار رساله ان لا يمكن استخدام وسائل المساعدة فى السوال الاول
          if (fristquestionAlertShow == true) const FristquestionAlert(),
        ],
      ),

      //  OfflineBuilder(
      //   connectivityBuilder: (
      //     BuildContext context,
      //     ConnectivityResult connectivity,
      //     Widget child,
      //   ) {
      //     final bool connected = connectivity != ConnectivityResult.none;

      //     if (connected) {

      //     } else {
      //       return CircularProgressIndicator(); // buildNoInternetWidget();
      //     }
      //   },
      //   child: Container(
      //       color: MyColors.black.withOpacity(20),
      //       child: CircularProgressIndicator()),
      // ),
    );
  }
}
