import 'dart:convert';

Startj_model dataModelFromJson(String str) =>
    Startj_model.fromJson(json.decode(str));
String dataModelToJson( Startj_model data) => json.encode(data.toJson());
class Startj_model {
  Data? data;

  Startj_model({this.data});

  Startj_model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? heading1;
  String? content1;
  String? heading2;
  String? content2;
  int? iV;

  Data(
      {this.sId,
      this.heading1,
      this.content1,
      this.heading2,
      this.content2,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    heading1 = json['heading1'];
    content1 = json['content1'];
    heading2 = json['heading2'];
    content2 = json['content2'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['heading1'] = this.heading1;
    data['content1'] = this.content1;
    data['heading2'] = this.heading2;
    data['content2'] = this.content2;
    data['__v'] = this.iV;
    return data;
  }
}
