import 'dart:convert';

storiesmodel dataModelFromJson(String str) =>
    storiesmodel.fromJson(json.decode(str));
String dataModelToJson(storiesmodel data) => json.encode(data.toJson());
class storiesmodel {
  Story? story;

  storiesmodel({this.story});

  storiesmodel.fromJson(Map<String, dynamic> json) {
    story = json['story'] != null ? new Story.fromJson(json['story']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    return data;
  }
}

class Story {
  String? sId;
  String? title;
  String? description;
  String? story;
  String? media;
  List<Questions>? questions;
  int? iV;

  Story(
      {this.sId,
      this.title,
      this.description,
      this.story,
      this.media,
      this.questions,
      this.iV});

  Story.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    story = json['story'];
    media = json['media'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['story'] = this.story;
    data['media'] = this.media;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}


class Questions {
  String? sId;
  String? schoolTimeStory;
  String? question;
  List<String>? options;
  int? iV;

  Questions(
      {this.sId, this.schoolTimeStory, this.question, this.options, this.iV});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    schoolTimeStory = json['schoolTimeStory'];
    question = json['question'];
    options = json['options'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['schoolTimeStory'] = this.schoolTimeStory;
    data['question'] = this.question;
    data['options'] = this.options;
    data['__v'] = this.iV;
    return data;
  }
}
