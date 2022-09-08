import 'dart:convert';

Update_depscore dataModelFromJson(String str) =>
    Update_depscore.fromJson(json.decode(str));
String dataModelToJson(Update_depscore data) => json.encode(data.toJson());
class Update_depscore {
  UpdatedScore? updatedScore;

  Update_depscore({this.updatedScore});

  Update_depscore.fromJson(Map<String, dynamic> json) {
    updatedScore = json['updatedScore'] != null
        ? new UpdatedScore.fromJson(json['updatedScore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.updatedScore != null) {
      data['updatedScore'] = this.updatedScore!.toJson();
    }
    return data;
  }
}

class UpdatedScore {
  String? sId;
  String? name;
  String? email;
  int? phq9Result;

  UpdatedScore({this.sId, this.name, this.email, this.phq9Result});

  UpdatedScore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phq9Result = json['phq9Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phq9Result'] = this.phq9Result;
    return data;
  }
}
