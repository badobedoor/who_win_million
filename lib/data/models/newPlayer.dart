// ignore_for_file: unnecessary_this, prefer_collection_literals

class NewPlayer {
  bool? success;
  Data? data;
  String? message;

  NewPlayer({this.success, this.data, this.message});

  NewPlayer.fromJson(Map<dynamic, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? id;

  Data({this.id});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
  }
}
