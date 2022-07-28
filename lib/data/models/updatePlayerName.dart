// ignore_for_file: unnecessary_this, prefer_collection_literals
class UpdatePlayerName {
  bool? success;
  Data? data;
  String? message;

  UpdatePlayerName({this.success, this.data, this.message});

  UpdatePlayerName.fromJson(Map<String, dynamic> json) {
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
  String? playerName;

  Data({this.playerName});

  Data.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['player_name'] = this.playerName;
    return data;
  }
}
