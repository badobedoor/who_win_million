// ignore_for_file: public_member_api_docs, sort_constructors_first, no_logic_in_create_state, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'package:who_win_million/business_logic/cubit/questions_cubit.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/data/models/Questions.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/showLoadingIndicator.dart';
import '../../business_logic/help/soundEffects.dart';
import '../../data/models/player.dart';
import '../screens/questions_screen.dart';
import 'answerQuestionContainer.dart';
import 'containerWithLinearGradient.dart';

class QuestionCenterContainer extends StatefulWidget {
  List<List<Object>> allScore;
  QuestionCenterContainer({
    Key? key,
    required this.allScore,
  }) : super(key: key);

  @override
  State<QuestionCenterContainer> createState() =>
      _QuestionCenterContainerState(allScore);
  static _QuestionCenterContainerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_QuestionCenterContainerState>();
}

class _QuestionCenterContainerState extends State<QuestionCenterContainer> {
  final List<List<Object>> allScore;
  late QuestionsData allQuestions;
  var currentIndex = 0;
  Color? answer1;
  Color? answer2;
  Color? answer3;
  Color? answer4;

  _QuestionCenterContainerState(this.allScore);
  @override
  void dispose() {
    // TODO: implement dispose
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
  }) async {
    //تغير لون الخلفيه وتشغيل صوت الانتظات
    finalAnswerColorChange(answerNumber, context);
    //اعداةالتيمر للصفر
    SoundEffects.setAndPlayFinalAnswerAudio();
    await Future.delayed(const Duration(seconds: 3, milliseconds: 30));

    //********corect answer
    if (answerNumber.toString() == question.correctAnswer) {
      corectAnswer(answerNumber);
    }
    // woring answer
    else {
      wrongAnswer(answerNumber);
    }
  }

  void corectAnswer(int answerNumber) async {
    corectAnswerColorChange(answerNumber, context);
    SoundEffects.setAndPlayCorrectAnswerAudio();
    await Future.delayed(const Duration(seconds: 4));

    if (currentIndex <= 16) {
      resrtAnswerColorChange(answerNumber, context);
      if (currentIndex == 16) {
        //نهايه اللعبه
        BlocProvider.of<QuestionsCubit>(context).increaseScorebyID(
            id: PlayerAccount.playerId!, playerScore: 1000000);
        //صوت الفوز بالمليون
        SoundEffects.setAndPlayMillionWinAudio();
        endOfTheGame(gameEndScore: 1000000, context: context);
      }
      for (var i = 0; i <= 16; i++) {
        //التحكم فى استايل الاسكور الى على يسار الشاشه
        if (i == currentIndex + 1) {
          //وضع الاستيل على الاسكور المناسب للسوال
          allScore[i][1] = true;
          QuestionsScreen.of(context)!.allScoreDataChange = allScore;
        } else {
          //الغاء اى استايل سابق
          allScore[i][1] = false;
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
        SoundEffects.setAndPlayQuestionHardAudio();
      } else if (currentIndex == 12) {
        // صوت مؤقت الوقت فى الاسئله الصعبة
        SoundEffects.questionHardAudioDispose();
        SoundEffects.setAndPlayQuestionsVeryHardAudio();
      }
    }
  }

  void wrongAnswer(int answerNumber) async {
    wrongAnswerColorChange(answerNumber, context);
    SoundEffects.setAndPlaywrongAnswerAudio();
    await Future.delayed(const Duration(seconds: 3));
    var res = 0;
    resrtAnswerColorChange(answerNumber, context);
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
    if (res == 750000) SoundEffects.setAndPlayMillionLoseAudio();
    endOfTheGame(gameEndScore: res, context: context);
  }

  void endOfTheGame({
    required int gameEndScore,
    required BuildContext context,
  }) {
    //استدعاء اساله جديده
    BlocProvider.of<QuestionsCubit>(context).getRandomQuestion();
    //ايقاف الاصوات الى شغاله
    if (SoundEffects.questionHardAudio.playing)
      SoundEffects.questionHardAudio.stop();
    if (SoundEffects.questionsEseyAudio.playing)
      SoundEffects.questionsEseyAudio.stop();
    if (SoundEffects.questionsVeryHardAudio.playing)
      SoundEffects.questionsVeryHardAudio.stop();
    //تغير نتيجه اللاعب
    QuestionsScreen.of(context)!.gameEndScoreText = gameEndScore.toString();
    //عرض شاشه الاسكور
    QuestionsScreen.of(context)!.endGameAlertShow = true;
  }

  void finalAnswerColorChange(int answerNumber, context) {
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

  void resrtAnswerColorChange(int answerNumber, context) {
    setState(() {
      answer1 = null;
      answer2 = null;
      answer3 = null;
      answer4 = null;
    });
  }

  void wrongAnswerColorChange(int answerNumber, context) {
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

  void corectAnswerColorChange(int answerNumber, context) {
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
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        if (state is QuestionsLoded) {
          if ((state).questions.success == true) {
            allQuestions = (state).questions;
          }

          var question = allQuestions.data!.elementAt(currentIndex);
          return buildLoadedListWidgets(question);
        } else {
          return FutureBuilder(
            future: Future.delayed(
              const Duration(
                seconds: 1,
              ),
              () =>
                  BlocProvider.of<QuestionsCubit>(context).getRandomQuestion(),
            ),
            builder: (context, snapshot) => showLoadingIndicator(),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidgets(question) {
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
              InkWell(
                onTap: () => answer(
                  answerNumber: 1,
                  question: question,
                ),
                child: AnswerQuestionContainer(
                  answerText: question.answer1!, //'نص الجواب ؟',
                  answerNumber: ":1",
                  color: answer1,
                ),
              ),
              25.horizontalSpace,
              InkWell(
                onTap: () => answer(
                  answerNumber: 2,
                  question: question,
                ),
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
              InkWell(
                onTap: () => answer(
                  answerNumber: 3,
                  question: question,
                ),
                child: AnswerQuestionContainer(
                  answerText: question.answer3!, //'نص الجواب ؟',
                  answerNumber: ":3",
                  color: answer3,
                ),
              ),
              25.horizontalSpace,
              InkWell(
                onTap: () => answer(
                  answerNumber: 4,
                  question: question,
                ),
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
