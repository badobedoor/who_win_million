// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:who_win_million/data/models/getPlayerScore.dart';

import '../models/getLeaderboard.dart';
import '../web_services/leaderboard_web_services.dart';

class LeaderbordRepository {
  LeaderbordWebServices leaderbordWebServices;
  LeaderbordRepository({
    required this.leaderbordWebServices,
  });

  //get
  Future<List<LeaderboardData>> getLeaderboard() async {
    // Map<String, dynamic>
    final leaderboard = await leaderbordWebServices.getLeaderboard();
    if (leaderboard != {}) {
      Leaderboard res = Leaderboard.fromJson(leaderboard);

      if (res.success == true) {
        return res.data!;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  //get
  Future<PlayerScore> getPlayerScoreByID({required int id}) async {
    // Map<String, dynamic>
    final playerScore = await leaderbordWebServices.getPlayerScoreByID(id: id);
    if (playerScore != {}) {
      var res = PlayerScore.fromJson(playerScore);
      return res;
    } else {
      return PlayerScore();
    }
  }
}
