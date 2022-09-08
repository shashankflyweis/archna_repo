import 'dart:convert';
Profilemodel dataModelFromJson(String str) =>
    Profilemodel.fromJson(json.decode(str));
String dataModelToJson(Profilemodel data) => json.encode(data.toJson());
class Profilemodel {
  UpdatedUser? updatedUser;

  Profilemodel({this.updatedUser});

  Profilemodel.fromJson(Map<String, dynamic> json) {
    updatedUser = json['updatedUser'] != null
        ? new UpdatedUser.fromJson(json['updatedUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.updatedUser != null) {
      data['updatedUser'] = this.updatedUser!.toJson();
    }
    return data;
  }
}

class UpdatedUser {
  String? sId;
  String? name;
  String? mobile;
  String? email;
  bool? agreeTermsPolicy;
  String? role;
  int? phq9Result;
  int? gad7Result;
  int? iV;
  List<SchoolStoryProgress>? schoolStoryProgress;
  int? numLessonCompleted;
  bool? allLessonCompleted;
  int? numCognitiveDistortionCompleted;
  String? age;
  String? gender;
  String? profileImage;
  List<LessonProgress>? lessonProgress;
  List<CongnitiveDistortionProgress>? congnitiveDistortionProgress;

  UpdatedUser(
      {this.sId,
      this.name,
      this.mobile,
      this.email,
      this.agreeTermsPolicy,
      this.role,
      this.phq9Result,
      this.gad7Result,
      this.iV,
      this.schoolStoryProgress,
      this.numLessonCompleted,
      this.allLessonCompleted,
      this.numCognitiveDistortionCompleted,
      this.age,
      this.gender,
      this.profileImage,
      this.lessonProgress,
      this.congnitiveDistortionProgress});

  UpdatedUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    agreeTermsPolicy = json['agreeTermsPolicy'];
    role = json['role'];
    phq9Result = json['phq9Result'];
    gad7Result = json['gad7Result'];
    iV = json['__v'];
    if (json['schoolStoryProgress'] != null) {
      schoolStoryProgress = <SchoolStoryProgress>[];
      json['schoolStoryProgress'].forEach((v) {
        schoolStoryProgress!.add(new SchoolStoryProgress.fromJson(v));
      });
    }
    numLessonCompleted = json['numLessonCompleted'];
    allLessonCompleted = json['allLessonCompleted'];
    numCognitiveDistortionCompleted = json['numCognitiveDistortionCompleted'];
    age = json['age'];
    gender = json['gender'];
    profileImage = json['profileImage'];
    if (json['lessonProgress'] != null) {
      lessonProgress = <LessonProgress>[];
      json['lessonProgress'].forEach((v) {
        lessonProgress!.add(new LessonProgress.fromJson(v));
      });
    }
    if (json['congnitiveDistortionProgress'] != null) {
      congnitiveDistortionProgress = <CongnitiveDistortionProgress>[];
      json['congnitiveDistortionProgress'].forEach((v) {
        congnitiveDistortionProgress!
            .add(new CongnitiveDistortionProgress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['agreeTermsPolicy'] = this.agreeTermsPolicy;
    data['role'] = this.role;
    data['phq9Result'] = this.phq9Result;
    data['gad7Result'] = this.gad7Result;
    data['__v'] = this.iV;
    if (this.schoolStoryProgress != null) {
      data['schoolStoryProgress'] =
          this.schoolStoryProgress!.map((v) => v.toJson()).toList();
    }
    data['numLessonCompleted'] = this.numLessonCompleted;
    data['allLessonCompleted'] = this.allLessonCompleted;
    data['numCognitiveDistortionCompleted'] =
        this.numCognitiveDistortionCompleted;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['profileImage'] = this.profileImage;
    if (this.lessonProgress != null) {
      data['lessonProgress'] =
          this.lessonProgress!.map((v) => v.toJson()).toList();
    }
    if (this.congnitiveDistortionProgress != null) {
      data['congnitiveDistortionProgress'] =
          this.congnitiveDistortionProgress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolStoryProgress {
  String? schoolStoryId;
  int? percentCompleted;

  SchoolStoryProgress({this.schoolStoryId, this.percentCompleted});

  SchoolStoryProgress.fromJson(Map<String, dynamic> json) {
    schoolStoryId = json['schoolStoryId'];
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolStoryId'] = this.schoolStoryId;
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}

class LessonProgress {
  String? lessonId;
  int? percentCompleted;

  LessonProgress({this.lessonId, this.percentCompleted});

  LessonProgress.fromJson(Map<String, dynamic> json) {
    lessonId = json['lessonId'];
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lessonId'] = this.lessonId;
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}

class CongnitiveDistortionProgress {
  String? distortionId;
  int? percentCompleted;

  CongnitiveDistortionProgress({this.distortionId, this.percentCompleted});

  CongnitiveDistortionProgress.fromJson(Map<String, dynamic> json) {
    distortionId = json['distortionId'];
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distortionId'] = this.distortionId;
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}
