import 'dart:convert';

Update_anxscore dataModelFromJson(String str) =>
    Update_anxscore.fromJson(json.decode(str));
String dataModelToJson( Update_anxscore data) => json.encode(data.toJson());
class Update_anxscore {
  UpdatedScore? updatedScore;

  Update_anxscore({this.updatedScore});

  Update_anxscore.fromJson(Map<String, dynamic> json) {
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
  int? gad7Result;

  UpdatedScore({this.sId, this.name, this.email, this.gad7Result});

  UpdatedScore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    gad7Result = json['gad7Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gad7Result'] = this.gad7Result;
    return data;
  }
}

