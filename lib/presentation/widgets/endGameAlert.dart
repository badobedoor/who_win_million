// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

import '../../business_logic/cubit/questions_cubit.dart';
import '../../business_logic/help/soundEffects.dart';
import '../../business_logic/provider/variablesProvider.dart';
import '../../constants/strings.dart';
import '../screens/questions_screen.dart';

class EndGameAlert extends StatelessWidget {
  const EndGameAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<Object>> allScore = [];
    var scoreText =
        Provider.of<VariablesProvider>(context, listen: true).gameEndScoreText;
    bool isSoundOn =
        Provider.of<VariablesProvider>(context, listen: false).isSoundOn;
    void setAllScore() {
      intl.NumberFormat myFormat = intl.NumberFormat.decimalPattern('en_us');
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

    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 311,
        height: 166,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          20.verticalSpace,
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      ' لقد حصلت على ', //انتهى الوقت لقد حصلت على .... اجابه خاطئه لقد حصلت على
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                  )),
              TextSpan(
                  text: scoreText,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                      color: MyColors.darkGreen)),
              TextSpan(
                  text: ' نقطة',
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900)),
            ]),
          ),
          10.verticalSpace,
          NormalText(
            text: "هل تريد إعادة المحاولة ؟",
            color: MyColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
          25.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearButton(
                ontap: () async {
                  // setAllScore();
                  // BlocProvider.of<QuestionsCubit>(context).getRandomQuestion();
                  // Provider.of<VariablesProvider>(context, listen: false)
                  //     .resetAllScore();
                  // QuestionsScreen.of(context)!.allScoreDataChange = allScore;

                  var stopWatchTimer =
                      Provider.of<VariablesProvider>(context, listen: false)
                          .stopWatchTimer;
                  stopWatchTimer.dispose();
                  Provider.of<VariablesProvider>(context, listen: false)
                      .sets_StopWatchTimer();
                  stopWatchTimer =
                      Provider.of<VariablesProvider>(context, listen: false)
                          .stopWatchTimer;
                  stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  Provider.of<VariablesProvider>(context, listen: false)
                      .reset_HelpContaner();
                  Provider.of<VariablesProvider>(context, listen: false)
                      .set_gameEndScoreText('0');
                  Provider.of<VariablesProvider>(context, listen: false)
                      .set_endGameAlertShow(false);
                  // Navigator.pop(context);
                  if (isSoundOn) {
                    SoundEffects.setAndPlaystartgameAudio().whenComplete(
                        () => SoundEffects.setAndPlayQuestionsEseyAudio());
                  }

                  // Navigator.pushNamed(context, questionsScreen);
                },
                width: 103,
                height: 40,
                borderRadius: 10,
                child: NormalText(
                  text: "نعم",
                  color: MyColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              10.horizontalSpace,
              LinearButton(
                ontap: () {
                  Provider.of<VariablesProvider>(context, listen: false)
                      .reset_HelpContaner();
                  Provider.of<VariablesProvider>(context, listen: false)
                      .set_gameEndScoreText('0');
                  Provider.of<VariablesProvider>(context, listen: false)
                      .set_endGameAlertShow(false);
                  Navigator.pop(context);
                  if (isSoundOn) SoundEffects.setAndPlayOpeningAudio();
                },
                width: 103,
                height: 40,
                borderRadius: 10,
                child: NormalText(
                  text: "لا",
                  color: MyColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

void endOfTheGame({
  // required int gameEndScore,
  required BuildContext context,
}) {
  //استدعاء اساله جديده
  BlocProvider.of<QuestionsCubit>(context).getRandomQuestion();
  //ايقاف الاصوات الى شغاله
  if (SoundEffects.questionHardAudio.playing) {
    SoundEffects.questionHardAudio.stop();
  }
  if (SoundEffects.questionsEseyAudio.playing) {
    SoundEffects.questionsEseyAudio.stop();
  }
  if (SoundEffects.questionsVeryHardAudio.playing) {
    SoundEffects.questionsVeryHardAudio.stop();
  }

  //عرض شاشه الاسكور
  Provider.of<VariablesProvider>(context, listen: false)
      .set_endGameAlertShow(true);
}
