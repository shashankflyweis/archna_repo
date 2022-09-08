import 'dart:convert';

What_depmean dataModelFromJson(String str) =>
    What_depmean.fromJson(json.decode(str));
String dataModelToJson(What_depmean data) => json.encode(data.toJson());
class What_depmean {
  String? depressionSeverity;
  String? proposedTreatment;

  What_depmean({this.depressionSeverity, this.proposedTreatment});

  What_depmean.fromJson(Map<String, dynamic> json) {
    depressionSeverity = json['depressionSeverity'];
    proposedTreatment = json['proposedTreatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depressionSeverity'] = this.depressionSeverity;
    data['proposedTreatment'] = this.proposedTreatment;
    return data;
  }
}
