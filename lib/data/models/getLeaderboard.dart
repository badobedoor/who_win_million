// ignore_for_file: unnecessary_this, prefer_collection_literals

class Leaderboard {
  bool? success;
  List<LeaderboardData>? data;
  String? message;

  Leaderboard({this.success, this.data, this.message});

  Leaderboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <LeaderboardData>[];
      json['data'].forEach((v) {
        data!.add(LeaderboardData.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class LeaderboardData {
  int? id;
  String? playerName;
  int? playerScore;

  LeaderboardData({this.id, this.playerName, this.playerScore});

  LeaderboardData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['player_name'];
    playerScore = json['player_score'];
  }
}
