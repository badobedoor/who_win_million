// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../data/models/Questions.dart';

bool endGameAlertShow = false;

class VariablesProvider with ChangeNotifier {
  //************* */
  Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  int timer = 20;
  // int timerNumber = 60;
  bool deletAnswerOne = false;
  bool deletAnswertwo = false;
  bool deletAnswerthree = false;
  bool deletAnswerFour = false;
  bool endGameAlertShow = false;
  bool quitGameAlertShow = false;
  bool fristquestionAlertShow = false;
  bool callFriendContainerShow = false;
  bool usingTheCrowdContainerShow = false;
  bool callFriendUsed = false;
  bool nextQuestion = false;
  bool deletTwoAnswersUsed = false;
  bool usingTheCrowdUsed = false;
  bool isSoundOn = true;
  List<List<Object>> allScore = [];

  String gameEndScoreText = '0';
  String? correctAnswer;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 20;
  QuestionsData allQuestions = QuestionsData();
  Data question = Data();

  // void resetAllScore() {
  //   NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  //   allScore = [
  //     [100, true],
  //     [200, false],
  //     [300, false],
  //     [400, false],
  //     [500, false],
  //     [myFormat.format(1000), false],
  //     [myFormat.format(2000), false],
  //     [myFormat.format(4000), false],
  //     [myFormat.format(8000), false],
  //     [myFormat.format(16000), false],
  //     [myFormat.format(32000), false],
  //     [myFormat.format(64000), false],
  //     [myFormat.format(128000), false],
  //     [myFormat.format(250000), false],
  //     [myFormat.format(500000), false],
  //     [myFormat.format(750000), false],
  //     [myFormat.format(1000000), false],
  //   ];
  //   notifyListeners();
  // }

  // void set_AllScore(List<List<Object>> new_AllScore) {
  //   allScore = new_AllScore;
  //   notifyListeners();
  // }

  StopWatchTimer stopWatchTimer = StopWatchTimer();
  void sets_StopWatchTimer() {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:
          StopWatchTimer.getMilliSecFromSecond(60), // millisecond => minute.
    );
    notifyListeners();
  }

  Future setIsSoundOn(newIsSoundOn) async {
    isSoundOn = newIsSoundOn;

    var prefs = await getInstance();
    prefs.setBool('isSoundOn', newIsSoundOn);
    notifyListeners();
  }

  Future<bool> getIsSoundOn() async {
    var prefs = await getInstance();
    isSoundOn = prefs.getBool('isSoundOn') ?? true;
    notifyListeners();
    return isSoundOn;
  }

  void set_DeleteAnswer(int answerDeletNumber) {
    if (answerDeletNumber == 1) {
      deletAnswerOne = true;
    } else if (answerDeletNumber == 2) {
      deletAnswertwo = true;
    } else if (answerDeletNumber == 3) {
      deletAnswerthree = true;
    } else if (answerDeletNumber == 4) {
      deletAnswerFour = true;
    }
    notifyListeners();
  }

  void set_ResetAnswerStyle() {
    deletAnswerOne = false;
    deletAnswertwo = false;
    deletAnswerthree = false;
    deletAnswerFour = false;
    notifyListeners();
  }

  void set_Question(Data new_Question) {
    question = new_Question;
    notifyListeners();
  }

  void set_NextQuestion(bool new_NextQuestion) {
    nextQuestion = new_NextQuestion;
    notifyListeners();
  }

  void set_AllQuestions(QuestionsData new_AllQuestions) {
    allQuestions = new_AllQuestions;
    notifyListeners();
  }

  void set_CallFriendUsed(bool new_CallFriendUsed) {
    callFriendUsed = new_CallFriendUsed;
    notifyListeners();
  }

  void set_DeletTwoAnswersUsed(bool new_DeletTwoAnswersUsed) {
    deletTwoAnswersUsed = new_DeletTwoAnswersUsed;
    notifyListeners();
  }

  void set_UsingTheCrowdUsed(bool new_UsingTheCrowdUsed) {
    usingTheCrowdUsed = new_UsingTheCrowdUsed;
    notifyListeners();
  }

  void reset_HelpContaner() {
    usingTheCrowdUsed = false;
    deletTwoAnswersUsed = false;
    callFriendUsed = false;
    notifyListeners();
  }

  void set_Timer(int new_Timer) {
    timer = new_Timer;
    notifyListeners();
  }

  // void set_TimerNumber(int new_TimerNumber) {
  //   timerNumber = new_TimerNumber;
  //   notifyListeners();
  // }

  void set_CallFriendContainerShow(bool new_CallFriendContainerShow) {
    callFriendContainerShow = new_CallFriendContainerShow;
    notifyListeners();
  }

  void set_endGameAlertShow(bool new_EndGameAlertShow) {
    endGameAlertShow = new_EndGameAlertShow;
    notifyListeners();
  }

  void set_UsingTheCrowdContainerShow(bool new_UsingTheCrowdContainerShow) {
    usingTheCrowdContainerShow = new_UsingTheCrowdContainerShow;
    notifyListeners();
  }

  void set_FristquestionAlertShow(bool new_FristquestionAlertShow) {
    fristquestionAlertShow = new_FristquestionAlertShow;
    notifyListeners();
  }

  void set_quitGameAlertShow(bool new_QuitGameAlertShow) {
    quitGameAlertShow = new_QuitGameAlertShow;
    notifyListeners();
  }

  void set_gameEndScoreText(String new_GameEndScoreText) {
    gameEndScoreText = new_GameEndScoreText;
    notifyListeners();
  }

  void set_CorrectAnswer(String new_CorrectAnswer) {
    correctAnswer = new_CorrectAnswer;
    notifyListeners();
  }
}
