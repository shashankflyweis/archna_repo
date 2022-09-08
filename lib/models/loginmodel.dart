import 'dart:convert';

Loginmodel dataModelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));
String dataModelToJson(Loginmodel data) => json.encode(data.toJson());
class Loginmodel {
  String? token;
  bool? isHavingDiary;
  String? reasonForNotCreatingDiary;

  Loginmodel({this.token, this.isHavingDiary, this.reasonForNotCreatingDiary});

  Loginmodel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isHavingDiary = json['isHavingDiary'];
    reasonForNotCreatingDiary = json['reasonForNotCreatingDiary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isHavingDiary'] = this.isHavingDiary;
    data['reasonForNotCreatingDiary'] = this.reasonForNotCreatingDiary;
    return data;
  }
}
