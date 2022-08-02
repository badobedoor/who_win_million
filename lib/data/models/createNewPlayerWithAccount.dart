// ignore_for_file: unnecessary_this, prefer_collection_literals

class NewPlayerWithAccount {
  bool? success;
  Data? data;
  String? message;

  NewPlayerWithAccount({this.success, this.data, this.message});

  NewPlayerWithAccount.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  int? id;
  PlayerAccount? playerAccount;

  Data({this.playerName, this.id, this.playerAccount});

  Data.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    id = json['id'];
    playerAccount = json['player_account'] != null
        ? new PlayerAccount.fromJson(json['player_account'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_name'] = this.playerName;
    data['id'] = this.id;
    if (this.playerAccount != null) {
      data['player_account'] = this.playerAccount!.toJson();
    }
    return data;
  }
}

class PlayerAccount {
  String? playerEmail;
  String? emailType;
  int? playerId;

  PlayerAccount({this.playerEmail, this.emailType, this.playerId});

  PlayerAccount.fromJson(Map<String, dynamic> json) {
    playerEmail = json['player_email'];
    emailType = json['email_type'];
    playerId = json['player_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_email'] = this.playerEmail;
    data['email_type'] = this.emailType;
    data['player_id'] = this.playerId;
    return data;
  }
}
