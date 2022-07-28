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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? playerScore;

  Data({this.playerScore});

  Data.fromJson(Map<String, dynamic> json) {
    playerScore = json['player_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['player_score'] = this.playerScore;
    return data;
  }
}
