// ignore_for_file: unnecessary_this, prefer_collection_literals
class IncreaseScorebyID {
  bool? success;
  Data? data;
  String? message;

  IncreaseScorebyID({this.success, this.data, this.message});

  IncreaseScorebyID.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? playerScore;

  Data({this.playerScore});

  Data.fromJson(Map<String, dynamic> json) {
    playerScore = json['player_score'];
  }
}
