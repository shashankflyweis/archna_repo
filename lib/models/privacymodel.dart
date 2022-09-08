import 'dart:convert';

privacy_model dataModelFromJson(String str) =>
    privacy_model.fromJson(json.decode(str));
String dataModelToJson( privacy_model data) => json.encode(data.toJson());
class privacy_model {
  Data? data;

  privacy_model({this.data});

  privacy_model.fromJson(Map<String, dynamic> json) {
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
  String? heading;
  String? content;
  int? iV;

  Data({this.sId, this.heading, this.content, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    heading = json['heading'];
    content = json['content'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['heading'] = this.heading;
    data['content'] = this.content;
    data['__v'] = this.iV;
    return data;
  }
}
