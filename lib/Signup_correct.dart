import 'dart:convert';

Signup_correct dataModelFromJson(String str) =>
    Signup_correct.fromJson(json.decode(str));
String dataModelToJson(Signup_correct data) => json.encode(data.toJson());
class Signup_correct {
  String? message;
  String? token;
  RegisteredUser? registeredUser;

  Signup_correct({this.message, this.token, this.registeredUser});

  Signup_correct.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    registeredUser = json['registeredUser'] != null
        ? new RegisteredUser.fromJson(json['registeredUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.registeredUser != null) {
      data['registeredUser'] = this.registeredUser!.toJson();
    }
    return data;
  }
}

class RegisteredUser {
  String? name;
  String? mobile;
  String? email;
  String? profileImage;
  bool? agreeTermsPolicy;
  String? role;
  int? phq9Result;
  int? gad7Result;
  int? numLessonCompleted;
  int? numCognitiveDistortionCompleted;
  bool? allLessonCompleted;
  String? sId;
  List<SchoolStoryProgress>? schoolStoryProgress;
  List<LessonProgress>? lessonProgress;
  List<CongnitiveDistortionProgress>? congnitiveDistortionProgress;
  String? password;
  int? iV;

  RegisteredUser(
      {this.name,
      this.mobile,
      this.email,
      this.profileImage,
      this.agreeTermsPolicy,
      this.role,
      this.phq9Result,
      this.gad7Result,
      this.numLessonCompleted,
      this.numCognitiveDistortionCompleted,
      this.allLessonCompleted,
      this.sId,
      this.schoolStoryProgress,
      this.lessonProgress,
      this.congnitiveDistortionProgress,
      this.password,
      this.iV});

  RegisteredUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    profileImage = json['profileImage'];
    agreeTermsPolicy = json['agreeTermsPolicy'];
    role = json['role'];
    phq9Result = json['phq9Result'];
    gad7Result = json['gad7Result'];
    numLessonCompleted = json['numLessonCompleted'];
    numCognitiveDistortionCompleted = json['numCognitiveDistortionCompleted'];
    allLessonCompleted = json['allLessonCompleted'];
    sId = json['_id'];
    if (json['schoolStoryProgress'] != null) {
      schoolStoryProgress = <SchoolStoryProgress>[];
      json['schoolStoryProgress'].forEach((v) {
        schoolStoryProgress!.add(new SchoolStoryProgress.fromJson(v));
      });
    }
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
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['agreeTermsPolicy'] = this.agreeTermsPolicy;
    data['role'] = this.role;
    data['phq9Result'] = this.phq9Result;
    data['gad7Result'] = this.gad7Result;
    data['numLessonCompleted'] = this.numLessonCompleted;
    data['numCognitiveDistortionCompleted'] =
        this.numCognitiveDistortionCompleted;
    data['allLessonCompleted'] = this.allLessonCompleted;
    data['_id'] = this.sId;
    if (this.schoolStoryProgress != null) {
      data['schoolStoryProgress'] =
          this.schoolStoryProgress!.map((v) => v.toJson()).toList();
    }
    if (this.lessonProgress != null) {
      data['lessonProgress'] =
          this.lessonProgress!.map((v) => v.toJson()).toList();
    }
    if (this.congnitiveDistortionProgress != null) {
      data['congnitiveDistortionProgress'] =
          this.congnitiveDistortionProgress!.map((v) => v.toJson()).toList();
    }
    data['password'] = this.password;
    data['__v'] = this.iV;
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
