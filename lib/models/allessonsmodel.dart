import 'dart:convert';

Alllessons_model dataModelFromJson1(String str) =>
    Alllessons_model.fromJson(json.decode(str));
String dataModelToJson1( Alllessons_model data) => json.encode(data.toJson());
class Alllessons_model {
  List<Lessons>? lessons;

  Alllessons_model({this.lessons});

  Alllessons_model.fromJson(Map<String, dynamic> json) {
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  String? sId;
  String? title;
  String? description;

  Lessons({this.sId, this.title, this.description});

  Lessons.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
