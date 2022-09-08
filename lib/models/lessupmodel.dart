import 'dart:convert';

lessupmodel dataModelFromJson1(String str) =>
    lessupmodel.fromJson(json.decode(str));
String dataModelToJson1( lessupmodel data) => json.encode(data.toJson());
class lessupmodel {
  String? message;
  ProgressUpdated? progressUpdated;

  lessupmodel({this.message, this.progressUpdated});

  lessupmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    progressUpdated = json['progressUpdated'] != null
        ? new ProgressUpdated.fromJson(json['progressUpdated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.progressUpdated != null) {
      data['progressUpdated'] = this.progressUpdated!.toJson();
    }
    return data;
  }
}

class ProgressUpdated {
  String? sId;
  List<LessonProgress>? lessonProgress;
  int? iV;

  ProgressUpdated({this.sId, this.lessonProgress, this.iV});

  ProgressUpdated.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['lessonProgress'] != null) {
      lessonProgress = <LessonProgress>[];
      json['lessonProgress'].forEach((v) {
        lessonProgress!.add(new LessonProgress.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.lessonProgress != null) {
      data['lessonProgress'] =
          this.lessonProgress!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class LessonProgress {
  String? lessonId;
  int? percentCompleted;

  LessonProgress({this.lessonId, this.percentCompleted});

  LessonProgress.fromJson(Map<String, dynamic> json) {
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
