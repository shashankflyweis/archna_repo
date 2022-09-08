import 'dart:convert';

Aboutus_model dataModelFromJson(String str) =>
    Aboutus_model.fromJson(json.decode(str));
String dataModelToJson( Aboutus_model data) => json.encode(data.toJson());
class Aboutus_model {
  String? sId;
  String? aboutUs;

  Aboutus_model({this.sId, this.aboutUs});

  Aboutus_model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    aboutUs = json['aboutUs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['aboutUs'] = this.aboutUs;
    return data;
  }
}
