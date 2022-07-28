// ignore_for_file: unnecessary_this, prefer_collection_literals

class GetLeaderboard {
  bool? success;
  List<Data>? data;
  String? message;

  GetLeaderboard({this.success, this.data, this.message});

  GetLeaderboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? playerName;
  int? playerScore;

  Data({this.id, this.playerName, this.playerScore});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['player_name'];
    playerScore = json['player_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['player_name'] = this.playerName;
    data['player_score'] = this.playerScore;
    return data;
  }
}
