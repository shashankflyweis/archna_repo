import 'dart:convert';

What_anxmean dataModelFromJson(String str) =>
    What_anxmean.fromJson(json.decode(str));
String dataModelToJson(What_anxmean data) => json.encode(data.toJson());
class What_anxmean {
  String? anxietySeverity;

  What_anxmean({this.anxietySeverity});

  What_anxmean.fromJson(Map<String, dynamic> json) {
    anxietySeverity = json['anxietySeverity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anxietySeverity'] = this.anxietySeverity;
    return data;
  }
}
