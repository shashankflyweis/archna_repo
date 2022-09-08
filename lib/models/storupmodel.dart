import 'dart:convert';

storeupmodel dataModelFromJson1(String str) =>
    storeupmodel.fromJson(json.decode(str));
String dataModelToJson1( storeupmodel data) => json.encode(data.toJson());
class storeupmodel {
  String? message;
  ProgressUpdated? progressUpdated;

  storeupmodel({this.message, this.progressUpdated});

  storeupmodel.fromJson(Map<String, dynamic> json) {
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
  List<SchoolStoryProgress>? schoolStoryProgress;

  ProgressUpdated({this.sId, this.schoolStoryProgress});

  ProgressUpdated.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['schoolStoryProgress'] != null) {
      schoolStoryProgress = <SchoolStoryProgress>[];
      json['schoolStoryProgress'].forEach((v) {
        schoolStoryProgress!.add(new SchoolStoryProgress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.schoolStoryProgress != null) {
      data['schoolStoryProgress'] =
          this.schoolStoryProgress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolStoryProgress {
  String? schoolStoryId;
  int? percentCompleted;

  SchoolStoryProgress({this.schoolStoryId, this.percentCompleted});

  SchoolStoryProgress.fromJson(Map<String, dynamic> json) {
    schoolStoryId = json['schoolStoryId'];
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolStoryId'] = this.schoolStoryId;
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}
