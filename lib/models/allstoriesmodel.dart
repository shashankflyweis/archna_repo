import 'dart:convert';

Allstories_model dataModelFromJson(String str) =>
    Allstories_model.fromJson(json.decode(str));
String dataModelToJson( Allstories_model data) => json.encode(data.toJson());
class Allstories_model {
  List<Stories>? stories;

  Allstories_model({this.stories});

  Allstories_model.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      stories = <Stories>[];
      json['stories'].forEach((v) {
        stories!.add(new Stories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stories != null) {
      data['stories'] = this.stories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stories {
  String? sId;
  String? title;
  String? description;
  String? story;
  String? media;
  List<String>? questions;
  int? iV;

  Stories(
      {this.sId,
      this.title,
      this.description,
      this.story,
      this.media,
      this.questions,
      this.iV});

  Stories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    story = json['story'];
    media = json['media'];
    questions = json['questions'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['story'] = this.story;
    data['media'] = this.media;
    data['questions'] = this.questions;
    data['__v'] = this.iV;
    return data;
  }
}
