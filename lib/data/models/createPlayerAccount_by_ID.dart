// ignore_for_file: unnecessary_this, prefer_collection_literals
//
class CreatePlayerAccount_by_ID {
  bool? success;
  Data? data;
  String? message;

  CreatePlayerAccount_by_ID({this.success, this.data, this.message});

  CreatePlayerAccount_by_ID.fromJson(Map<String, dynamic> json) {
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
  String? playerEmail;
  String? emailType;
  String? playerId;

  Data({this.playerEmail, this.emailType, this.playerId});

  Data.fromJson(Map<String, dynamic> json) {
    playerEmail = json['player_email'];
    emailType = json['email_type'];
    playerId = json['player_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['player_email'] = this.playerEmail;
    data['email_type'] = this.emailType;
    data['player_id'] = this.playerId;
    return data;
  }
}
