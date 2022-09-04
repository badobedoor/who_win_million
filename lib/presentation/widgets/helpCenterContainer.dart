// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'package:who_win_million/business_logic/help/soundEffects.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/data/models/Questions.dart';
import 'package:who_win_million/presentation/screens/questions_screen.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';

import '../../business_logic/cubit/player_cubit.dart';
import '../../business_logic/cubit/questions_cubit.dart';
import '../../business_logic/functions.dart/question_screen_functions.dart';
import '../../business_logic/help/staticValues.dart';
import '../../business_logic/provider/variablesProvider.dart';
import 'endGameAlert.dart';

class HelpCenterContainer extends StatefulWidget {
  // final StopWatchTimer stopWatchTimer;
  final VoidCallback function;

  final List<List<Object>> allScore;
  const HelpCenterContainer({
    Key? key,
    required this.function,
    required this.allScore,
    // required this.stopWatchTimer,
  }) : super(key: key);

  @override
  State<HelpCenterContainer> createState() => _HelpCenterContainerState(
        allScore,
        //  stopWatchTimer
      );
}

class _HelpCenterContainerState extends State<HelpCenterContainer> {
  final List<List<Object>> allScore;

  // final StopWatchTimer stopWatchTimer;
  _HelpCenterContainerState(
    this.allScore,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // if (SoundEffects.deleteTwoAnswerAudio.playing) {
    //   // SoundEffects.deleteTwoAnswerAudio.stop();
    //   SoundEffects.deleteTwoAnswerAudioDispose();
    // }
    // if (SoundEffects.askTheAudienceAudio.playing) {
    //   SoundEffects.askTheAudienceAudioDispose();
    // }
    // if (SoundEffects.phoneFriendClockAudio.playing) {
    //   SoundEffects.phoneFriendClockAudioDispose();
    // }
    // SoundEffects.askTheAudienceAudioDispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSoundOn =
        Provider.of<VariablesProvider>(context, listen: true).isSoundOn;
    var question =
        Provider.of<VariablesProvider>(context, listen: true).question;
    var stopWatchTimer =
        Provider.of<VariablesProvider>(context, listen: true).stopWatchTimer;

    return Container(
      width: 475.w,
      height: 35.h,
      child: Row(
        children: [
          //الاتصال بصديق
          _CallFrind(
            question: question,
            isSoundOn: isSoundOn,
          ),
          17.horizontalSpace,
          //الاستعانه بالجمهور
          _AskTheAudience(
            question: question,
            isSoundOn: isSoundOn,
          ),
          30.horizontalSpace,
          //الموقت
          _Timer(stopWatchTimer: stopWatchTimer),
          30.horizontalSpace,
          //حذف اجابتين
          _DeleteTwoAnswer(
            question: question,
            isSoundOn: isSoundOn,
          ),
          17.horizontalSpace,
          //الانسحاب
          _QuitGame(),
        ],
      ),
    );
  }
}

class _QuitGame extends StatelessWidget {
  const _QuitGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<VariablesProvider>(context, listen: false)
          .set_quitGameAlertShow(true),
      child: HelpsContainer(
        child: Text(
          'الانسحاب',
          style: TextStyle(
            fontSize: 14.sp,
            color: MyColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _DeleteTwoAnswer extends StatelessWidget {
  const _DeleteTwoAnswer({
    Key? key,
    required this.question,
    required this.isSoundOn,
  }) : super(key: key);

  final Data question;
  final bool isSoundOn;

  @override
  Widget build(BuildContext context) {
    var deletTwoAnswersUsed =
        Provider.of<VariablesProvider>(context, listen: false)
            .deletTwoAnswersUsed;
    return InkWell(
      onTap: () {
        if (deletTwoAnswersUsed == false) {
          if (question.correctAnswer != null) {
            if (isSoundOn) SoundEffects.setAndPlaydeleteTwoAnswerAudio();
            Provider.of<VariablesProvider>(context, listen: false)
                .set_DeletTwoAnswersUsed(true);
            var answerNumbers = [1, 2, 3, 4];
            final _random = Random();
            int correctAnswer = int.parse('${question.correctAnswer}');
            answerNumbers.remove(correctAnswer);
            var element = answerNumbers[_random.nextInt(answerNumbers.length)];
            //حذف الرقم دا من البروفيدر
            Provider.of<VariablesProvider>(context, listen: false)
                .set_DeleteAnswer(element);
            answerNumbers.remove(element);
            element = answerNumbers[_random.nextInt(answerNumbers.length)];
            //حذف الرقم دا من البروفيدر
            Provider.of<VariablesProvider>(context, listen: false)
                .set_DeleteAnswer(element);

            Provider.of<VariablesProvider>(context, listen: false)
                .set_CorrectAnswer('${question.correctAnswer}');
          } else {
            Provider.of<VariablesProvider>(context, listen: false)
                .set_FristquestionAlertShow(true);
          }
        }
      },
      // onTap: () => stopWatchTimer.onExecute.add(StopWatchExecute.start),
      child: HelpsContainer(
        child: Text(
          '50 : 50',
          style: TextStyle(
            fontSize: 14.sp,
            color: deletTwoAnswersUsed ? MyColors.darkGreen : MyColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _Timer extends StatelessWidget {
  const _Timer({
    Key? key,
    required this.stopWatchTimer,
  }) : super(key: key);

  final StopWatchTimer stopWatchTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 78.w,
        height: 34.h,
        decoration: BoxDecoration(
          color: MyColors.yellow,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: MyColors.black),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        // jmh
        child: StreamBuilder<int>(
          stream: stopWatchTimer.rawTime,
          initialData: stopWatchTimer.rawTime.value,
          builder: (context, snap) {
            final value = snap.data;
            final displayTime = StopWatchTimer.getDisplayTime(value!,
                second: true, hours: false, milliSecond: false, minute: false);
            if (displayTime == "01") {
              timeEndGameOver(context);
              // Provider.of<VariablesProvider>(context, listen: false)
              //     .set_TimerNumber(00);
              return Text(
                '00',
                style: TextStyle(
                  fontSize: 15.sp, //20.sp,
                  color: MyColors.green,
                  fontWeight: FontWeight.w900,
                ),
              );
            } else {
              return Text(
                displayTime,
                style: TextStyle(
                  fontSize: 15.sp, //20.sp,
                  color: MyColors.green,
                  fontWeight: FontWeight.w900,
                ),
              );
            }
          },
        ));
  }
}

class _AskTheAudience extends StatelessWidget {
  const _AskTheAudience({
    Key? key,
    required this.question,
    required this.isSoundOn,
  }) : super(key: key);

  final Data question;
  final bool isSoundOn;

  @override
  Widget build(BuildContext context) {
    var usingTheCrowdUsed =
        Provider.of<VariablesProvider>(context, listen: false)
            .usingTheCrowdUsed;
    return InkWell(
      onTap: (() {
        if (usingTheCrowdUsed == false) {
          if (question.correctAnswer != null) {
            Provider.of<VariablesProvider>(context, listen: false)
                .set_UsingTheCrowdUsed(true);
            // if (isSoundOn)
            // SoundEffects.askTheAudienceAudio.play();
            SoundEffects.setAndPlayaskTheAudienceAudio();

            Provider.of<VariablesProvider>(context, listen: false)
                .set_CorrectAnswer('${question.correctAnswer}');
            Provider.of<VariablesProvider>(context, listen: false)
                .set_UsingTheCrowdContainerShow(true);
          } else {
            Provider.of<VariablesProvider>(context, listen: false)
                .set_FristquestionAlertShow(true);
          }
        }
      }),
      child: HelpsContainer(
        child: Icon(
          FontAwesomeIcons.users,
          color: usingTheCrowdUsed ? MyColors.darkGreen : MyColors.white,
          size: 14.sp,
        ),
      ),
    );
  }
}

class _CallFrind extends StatelessWidget {
  const _CallFrind({
    Key? key,
    required this.question,
    required this.isSoundOn,
  }) : super(key: key);

  final Data question;
  final bool isSoundOn;

  @override
  Widget build(BuildContext context) {
    var callFriendUsed =
        Provider.of<VariablesProvider>(context, listen: false).callFriendUsed;
    return InkWell(
      onTap: (() {
        if (callFriendUsed == false) {
          if (question.correctAnswer != null) {
            Provider.of<VariablesProvider>(context, listen: false)
                .set_CallFriendUsed(true);
            Provider.of<VariablesProvider>(context, listen: false)
                .set_CorrectAnswer('${question.correctAnswer}');
            Provider.of<VariablesProvider>(context, listen: false)
                .set_CallFriendContainerShow(true);
            if (isSoundOn) SoundEffects.setAndPlayphoneFriendClockAudio();
            // .whenComplete(() =>
            //     Provider.of<VariablesProvider>(context, listen: false)
            //         .set_CallFriendContainerShow(false));

          } else {
            Provider.of<VariablesProvider>(context, listen: false)
                .set_FristquestionAlertShow(true);
          }
        }
      }),
      child: HelpsContainer(
        child: Icon(
          FontAwesomeIcons.phoneFlip,
          color: callFriendUsed ? MyColors.darkGreen : MyColors.white,
          size: 14.sp,
        ),
      ),
    );
  }
}

class HelpsContainer extends StatelessWidget {
  final Widget child;
  const HelpsContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      width: 75,
      height: 35,
      borderRadius: 32.r,
      child: Container(
        alignment: Alignment.center,
        width: 73.w,
        height: 33.h,
        decoration: BoxDecoration(
          color: MyColors.green,
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
