// ignore_for_file: unnecessary_this, prefer_collection_literals

class PlayerScore {
  bool? success;
  Data? data;
  String? message;

  PlayerScore({this.success, this.data, this.message});

  PlayerScore.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  String? playerName;
  int? playerScore;
  int? playerRank;

  Data({this.playerName, this.playerScore, this.playerRank});

  Data.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    playerScore = json['player_score'];
    playerRank = json['player_rank'];
  }
}
