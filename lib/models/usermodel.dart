class usermodel {
  CurrentUser? currentUser;

  usermodel({this.currentUser});

  usermodel.fromJson(Map<String, dynamic> json) {
    currentUser = json['currentUser'] != null
        ? new CurrentUser.fromJson(json['currentUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentUser != null) {
      data['currentUser'] = this.currentUser!.toJson();
    }
    return data;
  }
}

class CurrentUser {
  String? sId;
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
  List<SchoolStoryProgress>? schoolStoryProgress;
  List<LessonProgress>? lessonProgress;
  List<CongnitiveDistortionProgress>? congnitiveDistortionProgress;
  int? iV;
  CurrentLocation? currentLocation;
  String? age;
  String? gender;

  CurrentUser(
      {this.sId,
      this.name,
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
      this.schoolStoryProgress,
      this.lessonProgress,
      this.congnitiveDistortionProgress,
      this.iV,
      this.currentLocation,
      this.age,
      this.gender});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    iV = json['__v'];
    currentLocation = json['currentLocation'] != null
        ? new CurrentLocation.fromJson(json['currentLocation'])
        : null;
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
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
    data['__v'] = this.iV;
    if (this.currentLocation != null) {
      data['currentLocation'] = this.currentLocation!.toJson();
    }
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}

class SchoolStoryProgress {
  SchoolStoryId? schoolStoryId;
  int? percentCompleted;

  SchoolStoryProgress({this.schoolStoryId, this.percentCompleted});

  SchoolStoryProgress.fromJson(Map<String, dynamic> json) {
    schoolStoryId = json['schoolStoryId'] != null
        ? new SchoolStoryId.fromJson(json['schoolStoryId'])
        : null;
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schoolStoryId != null) {
      data['schoolStoryId'] = this.schoolStoryId!.toJson();
    }
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}

class SchoolStoryId {
  String? sId;
  String? title;

  SchoolStoryId({this.sId, this.title});

  SchoolStoryId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class LessonProgress {
  SchoolStoryId? lessonId;
  int? percentCompleted;

  LessonProgress({this.lessonId, this.percentCompleted});

  LessonProgress.fromJson(Map<String, dynamic> json) {
    lessonId = json['lessonId'] != null
        ? new SchoolStoryId.fromJson(json['lessonId'])
        : null;
    percentCompleted = json['percentCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lessonId != null) {
      data['lessonId'] = this.lessonId!.toJson();
    }
    data['percentCompleted'] = this.percentCompleted;
    return data;
  }
}

class CongnitiveDistortionProgress {
  Null? distortionId;
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

class CurrentLocation {
  String? type;
  List<double>? coordinates;
  String? sId;

  CurrentLocation({this.type, this.coordinates, this.sId});

  CurrentLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}
