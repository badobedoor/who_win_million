import 'package:just_audio/just_audio.dart';

class SoundEffects {
  bool isSoundOn = true;

  //المؤثرات الصوتية الخاصه ببدايه اللعبه
  static final openingAudio = AudioPlayer();
  static final startgameAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بوسائل المساعدة
  static final deleteTwoAnswerAudio = AudioPlayer();
  static final askTheAudienceAudio = AudioPlayer();
  static final phoneFriendClockAudio = AudioPlayer();
  static final outOfTimeAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بالايجابه صح وخطا
  static final finalAnswerAudio = AudioPlayer();
  static final wrongAnswerAudio = AudioPlayer();
  static final correctAnswerAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بالاسئلة المهمه
  static final millionFinalAnswerAudio = AudioPlayer();
  static final millionLoseAudio = AudioPlayer();
  static final millionWinAudio = AudioPlayer();
  //المؤثرات الصوتية الخاصه بموقت السوال
  static final questionsEseyAudio = AudioPlayer();
  static final questionHardAudio = AudioPlayer();
  static final questionsVeryHardAudio = AudioPlayer();

  //الصوت فى بدايه اللعبه
  static Future setAndPlayOpeningAudio() async {
    String filePath = "assets/sounds/opening.mp3";
    await openingAudio.setAsset(filePath);
    await openingAudio.play();
  }

  //بداية جيم جديد
  static Future setAndPlaystartgameAudio() async {
    String filePath = "assets/sounds/startgame.mp3";
    await openingAudio.setAsset(filePath);
    await openingAudio.play();
  }

  //حذف اجابتين
  static Future setAndPlaydeleteTwoAnswerAudio() async {
    String filePath = "assets/sounds/deleteTwoAnswer.mp3";
    await deleteTwoAnswerAudio.setAsset(filePath);

    await deleteTwoAnswerAudio.play();
  }

  // سؤال الجمهور
  static Future setAndPlayaskTheAudienceAudio() async {
    String filePath = "assets/sounds/AskTheAudience.mp3";
    await askTheAudienceAudio.setAsset(filePath);
    await askTheAudienceAudio.play();
  }

  // الاتصال بصديق
  static Future setAndPlayphoneFriendClockAudio() async {
    String filePath = "assets/sounds/PhoneFriendClock.mp3";
    await phoneFriendClockAudio.setAsset(filePath);
    await phoneFriendClockAudio.play();
  }

  // الوقت انتهى
  static Future setAndPlayOutOfTimeAudio() async {
    String filePath = "assets/sounds/OutOfTime.mp3";
    await outOfTimeAudio.setAsset(filePath);
    await outOfTimeAudio.play();
  }

  // الاجابة الاخير ؟
  static Future setAndPlayFinalAnswerAudio() async {
    String filePath = "assets/sounds/finalAnswer.mp3";
    await finalAnswerAudio.setAsset(filePath);
    await finalAnswerAudio.play();
  }

  // الاجابة خطا
  static Future setAndPlaywrongAnswerAudio() async {
    String filePath = "assets/sounds/WrongAnswer.mp3";
    await wrongAnswerAudio.setAsset(filePath);
    await wrongAnswerAudio.play();
  }

  // الاجابة صح
  static Future setAndPlayCorrectAnswerAudio() async {
    String filePath = "assets/sounds/CorrectAnswer.mp3";
    await correctAnswerAudio.setAsset(filePath);
    await correctAnswerAudio.play();
  }

  // الاساءله الصعبه الاجابة الاخيرة
  static Future setAndPlayMillionFinalAnswerAudio() async {
    String filePath = "assets/sounds/MILLIONFinalAnswer.mp3";
    await millionFinalAnswerAudio.setAsset(filePath);
    await millionFinalAnswerAudio.play();
  }

  // الاسئله الصعبه الاجابه خطا
  static Future setAndPlayMillionLoseAudio() async {
    String filePath = "assets/sounds/MILLIONLOSE.mp3";
    await millionLoseAudio.setAsset(filePath);
    await millionLoseAudio.play();
  }

  // الاسئله الصعبه الاجابه صح
  static Future setAndPlayMillionWinAudio() async {
    String filePath = "assets/sounds/MILLIONWIN.mp3";
    await millionWinAudio.setAsset(filePath);
    await millionWinAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله السهله
  static Future setAndPlayQuestionsEseyAudio() async {
    String filePath = "assets/sounds/QuestionsEsey.mp3";
    await questionsEseyAudio.setAsset(filePath);
    await questionsEseyAudio.setLoopMode(LoopMode.all);
    await questionsEseyAudio.setVolume(.5);
    await questionsEseyAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله متوسطه الصعوبه
  static Future setAndPlayQuestionHardAudio() async {
    String filePath = "assets/sounds/QuestionHard.mp3";
    await questionHardAudio.setAsset(filePath);
    await questionHardAudio.setLoopMode(LoopMode.all);
    await questionHardAudio.play();
  }

  // صوت مؤقت الوقت فى الاسئله الصعبة
  static Future setAndPlayQuestionsVeryHardAudio() async {
    String filePath = "assets/sounds/QuestionsVeryHard.mp3";
    await questionsVeryHardAudio.setAsset(filePath);
    await questionsVeryHardAudio.setLoopMode(LoopMode.all);
    await questionsVeryHardAudio.play();
  }

  // ************************
  static openingAudioDispose() {
    openingAudio.dispose();
  }

  static startgameAudioDispose() {
    startgameAudio.dispose();
  }

  static deleteTwoAnswerAudioDispose() {
    deleteTwoAnswerAudio.dispose();
  }

  static askTheAudienceAudioDispose() {
    askTheAudienceAudio.dispose();
  }

  static phoneFriendClockAudioDispose() {
    phoneFriendClockAudio.dispose();
  }

  static outOfTimeAudioDispose() {
    outOfTimeAudio.dispose();
  }

  static finalAnswerAudioDispose() {
    finalAnswerAudio.dispose();
  }

  static wrongAnswerAudioDispose() {
    wrongAnswerAudio.dispose();
  }

  static correctAnswerAudioDispose() {
    correctAnswerAudio.dispose();
  }

  static millionFinalAnswerAudioDispose() {
    millionFinalAnswerAudio.dispose();
  }

  static millionLoseAudioDispose() {
    millionLoseAudio.dispose();
  }

  static millionWinAudioDispose() {
    millionWinAudio.dispose();
  }

  static questionsEseyAudioDispose() {
    questionsEseyAudio.dispose();
  }

  static questionHardAudioDispose() {
    questionHardAudio.dispose();
  }

  static questionsVeryHardAudioDispose() {
    questionsVeryHardAudio.dispose();
  }
}
