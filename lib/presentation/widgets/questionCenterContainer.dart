// ignore_for_file: public_member_api_docs, sort_constructors_first, no_logic_in_create_state, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toast/toast.dart';

import 'package:who_win_million/business_logic/cubit/questions_cubit.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/data/models/Questions.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/endGameAlert.dart';
import 'package:who_win_million/presentation/widgets/showLoadingIndicator.dart';

import '../../business_logic/functions.dart/question_screen_functions.dart';
import '../../business_logic/help/soundEffects.dart';
import '../../business_logic/provider/variablesProvider.dart';
import '../../data/models/player.dart';
import '../screens/questions_screen.dart';
import 'answerQuestionContainer.dart';
import 'containerWithLinearGradient.dart';

class QuestionCenterContainer extends StatefulWidget {
  // StopWatchTimer stopWatchTimer;
  final VoidCallback function;
  List<List<Object>> allScore;
  QuestionCenterContainer({
    Key? key,
    required this.function,
    required this.allScore,
    // required this.stopWatchTimer,
  }) : super(key: key);

  @override
  State<QuestionCenterContainer> createState() => _QuestionCenterContainerState(
        allScore,
      );
  static _QuestionCenterContainerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_QuestionCenterContainerState>();
}

class _QuestionCenterContainerState extends State<QuestionCenterContainer>
    with WidgetsBindingObserver {
  // final StopWatchTimer stopWatchTimer;
  final List<List<Object>> allScore;
  late QuestionsData allQuestions;
  var currentIndex = 0;
  Color? answer1;
  Color? answer2;
  Color? answer3;
  Color? answer4;

  _QuestionCenterContainerState(
    this.allScore,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // These are the callbacks
    switch (state) {
      case AppLifecycleState.resumed:
        var isSoundOn =
            Provider.of<VariablesProvider>(context, listen: false).isSoundOn;
        var stopWatchTimer =
            Provider.of<VariablesProvider>(context, listen: false)
                .stopWatchTimer;
        if (!stopWatchTimer.isRunning) {
          timeEndGameOver(context);
        }
        if (currentIndex >= 0 && currentIndex < 6) {
          if (isSoundOn) SoundEffects.setAndPlayQuestionsEseyAudio();
        }
        if (currentIndex >= 6 && currentIndex < 12) {
          // صوت مؤقت الوقت فى الاسئله متوسطه الصعوبه

          if (isSoundOn) SoundEffects.setAndPlayQuestionHardAudio();
        } else if (currentIndex >= 12) {
          // صوت مؤقت الوقت فى الاسئله الصعبة

          if (isSoundOn) SoundEffects.setAndPlayQuestionsVeryHardAudio();
        }
        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        if (SoundEffects.startgameAudio.playing)
          SoundEffects.startgameAudio.stop();
        if (SoundEffects.millionFinalAnswerAudio.playing) {
          SoundEffects.millionFinalAnswerAudio.stop();
        }
        if (SoundEffects.millionWinAudio.playing) {
          SoundEffects.millionWinAudio.stop();
        }
        if (SoundEffects.millionLoseAudio.playing) {
          SoundEffects.millionLoseAudio.stop();
        }
        if (SoundEffects.wrongAnswerAudio.playing) {
          SoundEffects.wrongAnswerAudio.stop();
        }
        if (SoundEffects.questionHardAudio.playing) {
          SoundEffects.questionHardAudio.stop();
        }
        if (SoundEffects.questionsEseyAudio.playing) {
          SoundEffects.questionsEseyAudio.stop();
        }
        if (SoundEffects.questionsVeryHardAudio.playing) {
          SoundEffects.questionsVeryHardAudio.stop();
        }
        if (SoundEffects.correctAnswerAudio.playing) {
          SoundEffects.correctAnswerAudio.stop();
        }
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Add the observer.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // Remove the observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    if (SoundEffects.startgameAudio.playing) SoundEffects.startgameAudio.stop();
    if (SoundEffects.millionFinalAnswerAudio.playing)
      SoundEffects.millionFinalAnswerAudio.stop();
    if (SoundEffects.millionWinAudio.playing)
      SoundEffects.millionWinAudio.stop();
    if (SoundEffects.millionLoseAudio.playing)
      SoundEffects.millionLoseAudio.stop();
    if (SoundEffects.wrongAnswerAudio.playing)
      SoundEffects.wrongAnswerAudio.stop();
    if (SoundEffects.questionHardAudio.playing)
      SoundEffects.questionHardAudio.stop();
    if (SoundEffects.questionsEseyAudio.playing)
      SoundEffects.questionsEseyAudio.stop();
    if (SoundEffects.questionsVeryHardAudio.playing)
      SoundEffects.questionsVeryHardAudio.stop();
    if (SoundEffects.correctAnswerAudio.playing)
      SoundEffects.correctAnswerAudio.stop();
  }

  void answer({
    required int answerNumber,
    required Data question,
    required StopWatchTimer stopWatchTimer,
  }) async {
    bool isSoundOn =
        Provider.of<VariablesProvider>(context, listen: false).isSoundOn;
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    //تغير لون الخلفيه وتشغيل صوت الانتظات
    finalAnswerColorChange(answerNumber);
    //اعداةالتيمر للصفر
    if (isSoundOn) SoundEffects.setAndPlayFinalAnswerAudio();
    await Future.delayed(const Duration(seconds: 3, milliseconds: 30));

    //********corect answer
    if (answerNumber.toString() == question.correctAnswer) {
      corectAnswer(answerNumber, isSoundOn);
      await Future.delayed(const Duration(seconds: 4));
      stopWatchTimer.onExecute.add(StopWatchExecute.reset);
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
      Provider.of<VariablesProvider>(context, listen: false)
          .set_NextQuestion(true);
    }
    // woring answer
    else {
      wrongAnswer(answerNumber, isSoundOn);
      await Future.delayed(const Duration(seconds: 4));
      Provider.of<VariablesProvider>(context, listen: false)
          .set_Question(Data());
      setState(() {
        currentIndex = 0;
      });
      // stopWatchTimer.dispose();
    }
    // await Future.delayed(const Duration(seconds: 4));
    Provider.of<VariablesProvider>(context, listen: false)
        .set_ResetAnswerStyle();
  }

  void corectAnswer(int answerNumber, isSoundOn) async {
    corectAnswerColorChange(answerNumber);
    if (isSoundOn) SoundEffects.setAndPlayCorrectAnswerAudio();
    await Future.delayed(const Duration(seconds: 4));

    //تغير الموقت
    // QuestionsScreen.of(context)!.endTimeChange = 50;

    // widget.function(); // calls method in parent
    if (currentIndex <= 16) {
      resrtAnswerColorChange();
      if (currentIndex == 16) {
        //نهايه اللعبه
        BlocProvider.of<QuestionsCubit>(context).increaseScorebyID(
            id: PlayerAccount.playerId!, playerScore: 1000000);
        //صوت الفوز بالمليون
        if (isSoundOn) SoundEffects.setAndPlayMillionWinAudio();
        Provider.of<VariablesProvider>(context, listen: false)
            .set_gameEndScoreText('1000000');
        endOfTheGame(context: context);
      }
      var question = allQuestions.data!.elementAt(currentIndex + 1);
      Provider.of<VariablesProvider>(context, listen: false)
          .set_Question(question);
      for (var i = 0; i <= 16; i++) {
        //التحكم فى استايل الاسكور الى على يسار الشاشه
        if (i == currentIndex + 1) {
          //وضع الاستيل على الاسكور المناسب للسوال
          allScore[i][1] = true;
          // Provider.of<VariablesProvider>(context, listen: false)
          //     .set_AllScore(allScore);
          QuestionsScreen.of(context)!.allScoreDataChange = allScore;

          //تغير اسكور اللاعب
          var score = allScore[i - 1][0];
          Provider.of<VariablesProvider>(context, listen: false)
              .set_gameEndScoreText('$score');
        } else {
          //الغاء اى استايل سابق
          allScore[i][1] = false;
          // Provider.of<VariablesProvider>(context, listen: false)
          //     .set_AllScore(allScore);
          QuestionsScreen.of(context)!.allScoreDataChange = allScore;
        }
      }
      if (currentIndex < 16) {
        setState(() {
          currentIndex = currentIndex + 1;
        });
      }
      if (currentIndex == 6) {
        // صوت مؤقت الوقت فى الاسئله متوسطه الصعوبه
        SoundEffects.questionsEseyAudioDispose();
        if (isSoundOn) SoundEffects.setAndPlayQuestionHardAudio();
      } else if (currentIndex == 12) {
        // صوت مؤقت الوقت فى الاسئله الصعبة
        SoundEffects.questionHardAudioDispose();
        if (isSoundOn) SoundEffects.setAndPlayQuestionsVeryHardAudio();
      }
    }
  }

  void wrongAnswer(int answerNumber, isSoundOn) async {
    wrongAnswerColorChange(answerNumber);
    if (isSoundOn) SoundEffects.setAndPlaywrongAnswerAudio();
    await Future.delayed(const Duration(seconds: 3));
    var res = 0;
    resrtAnswerColorChange();
    for (var i = 0; i <= 16; i++) {
      //reset  Score text style
      if (i != 0) {
        allScore[i][1] = false;
      } else {
        allScore[0][1] = true;
      }
      if (i == currentIndex) {
        //اضافة الاسكور الى اللاعب
        i == 0
            ? res = 0
            : res = int.parse(
                ((allScore[i - 1][0]).toString()).replaceAll(",", ""));
        BlocProvider.of<QuestionsCubit>(context)
            .increaseScorebyID(id: PlayerAccount.playerId!, playerScore: res);
      }
    }
    //حفظ التغيرات الخاصه بقائمه الاسكور
    QuestionsScreen.of(context)!.allScoreDataChange = allScore;
    // Provider.of<VariablesProvider>(context, listen: false)
    //     .set_AllScore(allScore);

    if (res == 750000) {
      if (isSoundOn) SoundEffects.setAndPlayMillionLoseAudio();
      Provider.of<VariablesProvider>(context, listen: false)
          .set_gameEndScoreText('750000');
      endOfTheGame(context: context);
    } else {
      Provider.of<VariablesProvider>(context, listen: false)
          .set_gameEndScoreText('$res');
      endOfTheGame(context: context);
    }
  }

  void finalAnswerColorChange(int answerNumber) {
    setState(() {
      answerNumber == 1
          ? answer1 = MyColors.yellow //1
          : answerNumber == 2
              ? answer2 = MyColors.yellow //2
              : answerNumber == 3
                  ? answer3 = MyColors.yellow //3
                  : answer4 = MyColors.yellow; //4 ;
    });
  }

  void resrtAnswerColorChange() {
    setState(() {
      answer1 = null;
      answer2 = null;
      answer3 = null;
      answer4 = null;
    });
  }

  void wrongAnswerColorChange(int answerNumber) {
    setState(() {
      answerNumber == 1
          ? answer1 = MyColors.red //1
          : answerNumber == 2
              ? answer2 = MyColors.red //2
              : answerNumber == 3
                  ? answer3 = MyColors.red //3
                  : answer4 = MyColors.red; //4 ;
    });
  }

  void corectAnswerColorChange(int answerNumber) {
    setState(() {
      answerNumber == 1
          ? answer1 = MyColors.lightGreen //1
          : answerNumber == 2
              ? answer2 = MyColors.lightGreen //2
              : answerNumber == 3
                  ? answer3 = MyColors.lightGreen //3
                  : answer4 = MyColors.lightGreen; //4 ;
    });
  }

//********   UI    *********//
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (allQuestions.data != null) {
  //     Provider.of<VariablesProvider>(context, listen: false)
  //         .set_AllQuestions(allQuestions);
  //     var question = allQuestions.data!.elementAt(currentIndex);
  //     Provider.of<VariablesProvider>(context, listen: false)
  //         .set_Question(question);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        if (state is QuestionsLoded) {
          if ((state).questions.success != true) {
            return FutureBuilder(
              future: Future.delayed(
                const Duration(
                  seconds: 1,
                ),
                () => BlocProvider.of<QuestionsCubit>(context)
                    .getRandomQuestion(),
              ),
              builder: (context, snapshot) => showLoadingIndicator(),
            );
          } else {
            allQuestions = (state).questions;
            var question = allQuestions.data!.elementAt(currentIndex);

            return buildLoadedListWidgets(question);
          }
        }
        return FutureBuilder(
            future: Future.delayed(
              const Duration(
                seconds: 2,
              ),
              () =>
                  BlocProvider.of<QuestionsCubit>(context).getRandomQuestion(),
            ),
            builder: (context, snapshot) => showLoadingIndicator());
      },
    );
  }

  Widget buildLoadedListWidgets(question) {
    // Provider.of<VariablesProvider>(context, listen: false)
    //     .set_Question(question);
    var stopWatchTimer =
        Provider.of<VariablesProvider>(context, listen: false).stopWatchTimer;
    bool deletAnswerOne =
        Provider.of<VariablesProvider>(context, listen: false).deletAnswerOne;
    bool deletAnswertwo =
        Provider.of<VariablesProvider>(context, listen: false).deletAnswertwo;
    bool deletAnswerthree =
        Provider.of<VariablesProvider>(context, listen: false).deletAnswerthree;
    bool deletAnswerFour =
        Provider.of<VariablesProvider>(context, listen: false).deletAnswerFour;

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
              question.questionText!, //'نص السوال ؟'
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
              deletAnswerOne
                  ? const AnswerQuestionContainer(
                      answerText: '',
                      answerNumber: '',
                    )
                  : InkWell(
                      onTap: () => answer(
                          answerNumber: 1,
                          question: question,
                          stopWatchTimer: stopWatchTimer),
                      child: AnswerQuestionContainer(
                        answerText: question.answer1!, //'نص الجواب ؟',
                        answerNumber: ":1",
                        color: answer1,
                      ),
                    ),
              25.horizontalSpace,
              deletAnswertwo
                  ? const AnswerQuestionContainer(
                      answerText: '',
                      answerNumber: '',
                    )
                  : InkWell(
                      onTap: () => answer(
                          answerNumber: 2,
                          question: question,
                          stopWatchTimer: stopWatchTimer),
                      child: AnswerQuestionContainer(
                        answerText: question.answer2!, // 'نص الجواب ؟',
                        answerNumber: ":2",
                        color: answer2,
                      ),
                    ),
            ],
          ),
          20.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            children: [
              deletAnswerthree
                  ? const AnswerQuestionContainer(
                      answerText: '',
                      answerNumber: '',
                    )
                  : InkWell(
                      onTap: () => answer(
                          answerNumber: 3,
                          question: question,
                          stopWatchTimer: stopWatchTimer),
                      child: AnswerQuestionContainer(
                        answerText: question.answer3!, //'نص الجواب ؟',
                        answerNumber: ":3",
                        color: answer3,
                      ),
                    ),
              25.horizontalSpace,
              deletAnswerFour
                  ? const AnswerQuestionContainer(
                      answerText: '',
                      answerNumber: '',
                    )
                  : InkWell(
                      onTap: () => answer(
                          answerNumber: 4,
                          question: question,
                          stopWatchTimer: stopWatchTimer),
                      child: AnswerQuestionContainer(
                        answerText: question.answer4!, //'نص الجواب ؟',
                        answerNumber: ":4",
                        color: answer4,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
