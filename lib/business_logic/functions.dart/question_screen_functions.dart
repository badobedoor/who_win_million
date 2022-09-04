import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../presentation/screens/questions_screen.dart';
import '../cubit/player_cubit.dart';
import '../cubit/questions_cubit.dart';
import '../help/soundEffects.dart';
import '../provider/variablesProvider.dart';

timeEndGameOver(context) async {
  // controller.disposeTimer();
  //end game
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
  SoundEffects.setAndPlayOutOfTimeAudio();
  await Future.delayed(const Duration(milliseconds: 1500));
  //استدعاء اساله جديده
  BlocProvider.of<QuestionsCubit>(context).getRandomQuestion();
  //عرض شاشه الاسكور
  Provider.of<VariablesProvider>(context, listen: false)
      .set_endGameAlertShow(true);
}
