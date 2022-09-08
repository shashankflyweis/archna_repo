class situation_model {
  situation_model({
    String? id,
    DistortionId? distortionId,
    String? title,
    List<String>? points,
    int? iV,
  }) {
    _id = id;
    _distortionId = distortionId;
    _title = title;
    _points = points;
    _iV = iV;
  }
  situation_model.fromJson(dynamic json) {
    _id = json['_id'];
    _distortionId = json['distortionId'] != null
        ? new DistortionId.fromJson(json['distortionId'])
        : null;
    _title = json['title'];
    _points = json['points'].cast<String>();
    _iV = json['__v'];
  }
  String? _id;
  DistortionId? _distortionId;
  String? _title;
  List<String>? _points;
  int? _iV;
  String? get id => _id;
  DistortionId? get distortionId => _distortionId;
  String? get title => _title;
  List<String>? get points => _points;
  int? get iV => _iV;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = _id;
    if (_distortionId != null) {
      data['distortionId'] = _distortionId!.toJson();
    }
    data['title'] = _title;
    data['points'] = _points;
    data['__v'] = _iV;
    return data;
  }
}

class DistortionId {
  DistortionId({
    String? sId,
    String? title,
    String? description,
  }) {
    _sId = sId;
    _title = title;
    _description = description;
  }
  DistortionId.fromJson(dynamic json) {
    _sId = json['_id'];
    _title = json['title'];
    _description = json['description'];
  }
  String? _sId;
  String? _title;
  String? _description;
String? get sId=>_sId;
  String?get title=> _title;
  String? get description=>_description;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = _sId;
    data['title'] = _title;
    data['description'] = _description;
    return data;
  }
}
