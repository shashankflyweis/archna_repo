import 'dart:convert';

happiness_model dataModelFromJson(String str) =>
    happiness_model.fromJson(json.decode(str));
String dataModelToJson( happiness_model data) => json.encode(data.toJson());
class happiness_model {
  String? sId;
  String? diaryIsOfUser;
  String? date;
  List<String>? situation;
  List<String>? thoughts;
  List<String>? feelings;
  List<String>? behaviours;
  List<String>? distortion;
  String? createdAt;
  String? updatedAt;
  int? iV;

  happiness_model(
      {this.sId,
      this.diaryIsOfUser,
      this.date,
      this.situation,
      this.thoughts,
      this.feelings,
      this.behaviours,
      this.distortion,
      this.createdAt,
      this.updatedAt,
      this.iV});

  happiness_model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diaryIsOfUser = json['diaryIsOfUser'];
    date = json['date'];
    situation = json['situation'].cast<String>();
    thoughts = json['thoughts'].cast<String>();
    feelings = json['feelings'].cast<String>();
    behaviours = json['behaviours'].cast<String>();
    distortion = json['distortion'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['diaryIsOfUser'] = this.diaryIsOfUser;
    data['date'] = this.date;
    data['situation'] = this.situation;
    data['thoughts'] = this.thoughts;
    data['feelings'] = this.feelings;
    data['behaviours'] = this.behaviours;
    data['distortion'] = this.distortion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
