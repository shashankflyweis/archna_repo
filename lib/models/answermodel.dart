import 'dart:convert';

answermodel dataModelFromJson(String str) =>
 answermodel.fromJson(json.decode(str));
String dataModelToJson( answermodel data) => json.encode(data.toJson());
class answermodel {
  String? message;
  GivenAnswer? givenAnswer;

  answermodel({this.message, this.givenAnswer});

  answermodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    givenAnswer = json['givenAnswer'] != null
        ? new GivenAnswer.fromJson(json['givenAnswer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.givenAnswer != null) {
      data['givenAnswer'] = this.givenAnswer!.toJson();
    }
    return data;
  }
}

class GivenAnswer {
  String? answeredBy;
  String? question;
  String? answer;
  String? lessonId;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GivenAnswer(
      {this.answeredBy,
      this.question,
      this.answer,
      this.lessonId,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GivenAnswer.fromJson(Map<String, dynamic> json) {
    answeredBy = json['answeredBy'];
    question = json['question'];
    answer = json['answer'];
    lessonId = json['lessonId'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answeredBy'] = this.answeredBy;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['lessonId'] = this.lessonId;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
