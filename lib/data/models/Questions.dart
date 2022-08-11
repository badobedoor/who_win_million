// ignore_for_file: prefer_collection_literals

class QuestionsData {
  bool? success;
  List<Data>? data;
  String? message;

  QuestionsData({this.success, this.data, this.message});

  QuestionsData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? questionText;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? correctAnswer;
  String? questionLevel;
  int? userId;

  Data(
      {this.id,
      this.questionText,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.correctAnswer,
      this.questionLevel,
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    answer1 = json['answer1'];
    answer2 = json['answer2'];
    answer3 = json['answer3'];
    answer4 = json['answer4'];
    correctAnswer = json['correct_answer'];
    questionLevel = json['question_level'];
    userId = json['user_id'];
  }
}
