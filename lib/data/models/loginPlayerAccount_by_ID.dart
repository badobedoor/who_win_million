// ignore_for_file: unnecessary_this, prefer_collection_literals
//
class LoginPlayerAccountByID {
  bool? success;
  Data? data;
  String? message;

  LoginPlayerAccountByID({this.success, this.data, this.message});

  LoginPlayerAccountByID.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
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
}
