import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundEffects {
  bool isSoundOn = true;

  //المؤثرات الصوتية الخاصه ببدايه اللعبه
  final openingAudio = AudioPlayer();
  final startgameAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بوسائل المساعدة
  final deleteTwoAnswerAudio = AudioPlayer();
  final askTheAudienceAudio = AudioPlayer();
  final phoneFriendClockAudio = AudioPlayer();
  final outOfTimeAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بالايجابه صح وخطا
  final finalAnswerAudio = AudioPlayer();
  final wrongAnswerAudio = AudioPlayer();
  final correctAnswerAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بالاسئلة المهمه
  final millionFinalAnswerAudio = AudioPlayer();
  final millionLoseAudio = AudioPlayer();
  final millionWinAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بموقت السوال
  final questionsEseyAudio = AudioPlayer();
  final questionHardAudio = AudioPlayer();
  final questionsVeryHardAudio = AudioPlayer();

  //الصوت فى بدايه اللعبه
  Future setAndPlayOpeningAudio() async {
    String filePath = "assets/sounds/opening.mp3";
    await openingAudio.setAsset(filePath);
    await openingAudio.play();
  }

  //بداية جيم جديد
  Future setAndPlaystartgameAudio() async {
    String filePath = "assets/sounds/startgame.mp3";
    await openingAudio.setAsset(filePath);
    await openingAudio.play();
  }

  //حذف اجابتين
  Future setAndPlaydeleteTwoAnswerAudio() async {
    String filePath = "assets/sounds/deleteTwoAnswer.mp3";
    await deleteTwoAnswerAudio.setAsset(filePath);
    await deleteTwoAnswerAudio.play();
  }

  // سؤال الجمهور
  Future setAndPlayaskTheAudienceAudio() async {
    String filePath = "assets/sounds/AskTheAudience.mp3";
    await askTheAudienceAudio.setAsset(filePath);
    await askTheAudienceAudio.play();
  }

  // الاتصال بصديق
  Future setAndPlayphoneFriendClockAudio() async {
    String filePath = "assets/sounds/PhoneFriendClock.mp3";
    await phoneFriendClockAudio.setAsset(filePath);
    await phoneFriendClockAudio.play();
  }

  // الوقت انتهى
  Future setAndPlayOutOfTimeAudio() async {
    String filePath = "assets/sounds/OutOfTime.mp3";
    await outOfTimeAudio.setAsset(filePath);
    await outOfTimeAudio.play();
  }

  // الاجابة الاخير ؟
  Future setAndPlayFinalAnswerAudio() async {
    String filePath = "assets/sounds/finalAnswer.mp3";
    await finalAnswerAudio.setAsset(filePath);
    await finalAnswerAudio.play();
  }

  // الاجابة خطا
  Future setAndPlaywrongAnswerAudio() async {
    String filePath = "assets/sounds/WrongAnswer.mp3";
    await wrongAnswerAudio.setAsset(filePath);
    await wrongAnswerAudio.play();
  }

  // الاجابة صح
  Future setAndPlayCorrectAnswerAudio() async {
    String filePath = "assets/sounds/CorrectAnswer.mp3";
    await correctAnswerAudio.setAsset(filePath);
    await correctAnswerAudio.play();
  }

  // الاساءله الصعبه الاجابة الاخيرة
  Future setAndPlayMillionFinalAnswerAudio() async {
    String filePath = "assets/sounds/MILLIONFinalAnswer.mp3";
    await millionFinalAnswerAudio.setAsset(filePath);
    await millionFinalAnswerAudio.play();
  }

  // الاسئله الصعبه الاجابه خطا
  Future setAndPlayMillionLoseAudio() async {
    String filePath = "assets/sounds/MILLIONLOSE.mp3";
    await millionLoseAudio.setAsset(filePath);
    await millionLoseAudio.play();
  }

  // الاسئله الصعبه الاجابه صح
  Future setAndPlayMillionWinAudio() async {
    String filePath = "assets/sounds/MILLIONWIN.mp3";
    await millionWinAudio.setAsset(filePath);
    await millionWinAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله السهله
  Future setAndPlayQuestionsEseyAudio() async {
    String filePath = "assets/sounds/QuestionsEsey.mp3";
    await questionsEseyAudio.setAsset(filePath);
    await questionsEseyAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله متوسطه الصعوبه
  Future setAndPlayQuestionHardAudio() async {
    String filePath = "assets/sounds/QuestionHard.mp3";
    await questionHardAudio.setAsset(filePath);
    await questionHardAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله الصعبة
  Future setAndPlayQuestionsVeryHardAudio() async {
    String filePath = "assets/sounds/QuestionsVeryHard.mp3";
    await questionsVeryHardAudio.setAsset(filePath);
    await questionsVeryHardAudio.play();
  }

  // ************************
  openingAudioDispose() {
    openingAudio.dispose();
  }

  startgameAudioDispose() {
    startgameAudio.dispose();
  }

  deleteTwoAnswerAudioDispose() {
    deleteTwoAnswerAudio.dispose();
  }

  askTheAudienceAudioDispose() {
    askTheAudienceAudio.dispose();
  }

  phoneFriendClockAudioDispose() {
    phoneFriendClockAudio.dispose();
  }

  outOfTimeAudioDispose() {
    outOfTimeAudio.dispose();
  }

  finalAnswerAudioDispose() {
    finalAnswerAudio.dispose();
  }

  wrongAnswerAudioDispose() {
    wrongAnswerAudio.dispose();
  }

  correctAnswerAudioDispose() {
    correctAnswerAudio.dispose();
  }

  millionFinalAnswerAudioDispose() {
    millionFinalAnswerAudio.dispose();
  }

  millionLoseAudioDispose() {
    millionLoseAudio.dispose();
  }

  millionWinAudioDispose() {
    millionWinAudio.dispose();
  }

  questionsEseyAudioDispose() {
    questionsEseyAudio.dispose();
  }

  questionHardAudioDispose() {
    questionHardAudio.dispose();
  }

  questionsVeryHardAudioDispose() {
    questionsVeryHardAudio.dispose();
  }
}
