import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/Questions.dart';
import '../../data/repository/questions_repository.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final QuestionsRepository questionsRepository;
  QuestionsData questions = QuestionsData();

  QuestionsCubit(this.questionsRepository) : super(QuestionsInitial());

  QuestionsData getRandomQuestion() {
    questionsRepository.getRandomQuestion().then((questions) {
      emit(QuestionsLoded(questions));
      this.questions = questions;
    });

    return questions;
  }

  Future increaseScorebyID({
    required int id,
    required int playerScore,
  }) async {
    questionsRepository
        .increaseScorebyID(id: id, playerScore: playerScore)
        .then((increaseScore) {
      if (increaseScore.success == true) {
        emit(IncreaseScorebyIDLoaded());
        return;
      }
      if (increaseScore.success == false) {
        emit(IncreaseScorebyIDErrorCase(errorMessage: increaseScore.message));
      }
    });
  }
}
