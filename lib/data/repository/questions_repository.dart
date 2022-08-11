import '../models/Questions.dart';
import '../models/increaseScorebyID.dart';
import '../web_services/questions_web_Services.dart';

class QuestionsRepository {
  QuestionsWebServices questionsWebServices;
  QuestionsRepository(this.questionsWebServices);

  //

  Future<QuestionsData> getRandomQuestion() async {
    final questions = await questionsWebServices.getRandomQuestion();
    if (questions != {}) {
      var res = QuestionsData.fromJson(questions);

      return res;
    } else {
      return QuestionsData();
    }
  }

  Future<IncreaseScorebyID> increaseScorebyID({
    required int id,
    required int playerScore,
  }) async {
    final playerScoredata = await questionsWebServices.increaseScorebyID(
        id: id, playerScore: playerScore);
    if (playerScoredata != {}) {
      var res = IncreaseScorebyID.fromJson(playerScoredata);
      return res;
    } else {
      return IncreaseScorebyID();
    }
  }
}
