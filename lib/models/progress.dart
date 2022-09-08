import 'dart:convert';

progressmodel dataModelFromJson1(String str) =>
    progressmodel.fromJson(json.decode(str));
String dataModelToJson1( progressmodel data) => json.encode(data.toJson());
class progressmodel {
  String? lessonId;
  int? percentCompleted;

  progressmodel({this.lessonId, this.percentCompleted});

  progressmodel.fromJson(Map<String, dynamic> json) {
    lessonId = json['lessonId'];
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lessonId'] = this.lessonId;
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}
