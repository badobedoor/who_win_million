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
  String? playerName;
  String? id;
  PlayerAccount? playerAccount;

  Data({this.playerName, this.id, this.playerAccount});

  Data.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    id = json['id'];
    playerAccount = json['player_account'] != null
        ? new PlayerAccount.fromJson(json['player_account'])
        : null;
  }
}

class PlayerAccount {
  String? playerEmail;
  String? emailType;
  String? playerId;

  PlayerAccount({this.playerEmail, this.emailType, this.playerId});

  PlayerAccount.fromJson(Map<String, dynamic> json) {
    playerEmail = json['player_email'];
    emailType = json['email_type'];
    playerId = json['player_id'];
  }
}
