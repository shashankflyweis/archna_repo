import 'dart:convert';

Contactus_model dataModelFromJson(String str) =>
 Contactus_model.fromJson(json.decode(str));
String dataModelToJson( Contactus_model data) => json.encode(data.toJson());
class Contactus_model {
  String? sId;
  String? mobile;
  String? whatsapp;
  String? mail;
  int? iV;

  Contactus_model({this.sId, this.mobile, this.whatsapp, this.mail, this.iV});

  Contactus_model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    whatsapp = json['whatsapp'];
    mail = json['mail'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['whatsapp'] = this.whatsapp;
    data['mail'] = this.mail;
    data['__v'] = this.iV;
    return data;
  }
}
