// ignore_for_file: prefer_collection_literals

class Questions {
  bool? success;
  List<Data>? data;
  String? message;

  Questions({this.success, this.data, this.message});

  Questions.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['question_text'] = questionText;
    data['answer1'] = answer1;
    data['answer2'] = answer2;
    data['answer3'] = answer3;
    data['answer4'] = answer4;
    data['correct_answer'] = correctAnswer;
    data['question_level'] = questionLevel;
    data['user_id'] = userId;
    return data;
  }
}
