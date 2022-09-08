import 'dart:convert';

Lesson dataModelFromJson(String str) =>
    Lesson.fromJson(json.decode(str));
String dataModelToJson( Lesson data) => json.encode(data.toJson());
class Lesson {
  RequiredLesson? requiredLesson;

  Lesson({this.requiredLesson});

  Lesson.fromJson(Map<String, dynamic> json) {
    requiredLesson = json['requiredLesson'] != null
        ? new RequiredLesson.fromJson(json['requiredLesson'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requiredLesson != null) {
      data['requiredLesson'] = this.requiredLesson!.toJson();
    }
    return data;
  }
}

class RequiredLesson {
  String? sId;
  String? title;
  String? description;
  String? media;
  StoryExplaination? storyExplaination;
  String? summary;
  Questions? questions;
  int? iV;

  RequiredLesson(
      {this.sId,
      this.title,
      this.description,
      this.media,
      this.storyExplaination,
      this.summary,
      this.questions,
      this.iV});

  RequiredLesson.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    media = json['media'];
    storyExplaination = json['storyExplaination'] != null
        ? new StoryExplaination.fromJson(json['storyExplaination'])
        : null;
    summary = json['summary'];
    questions = json['questions'] != null
        ? new Questions.fromJson(json['questions'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['media'] = this.media;
    if (this.storyExplaination != null) {
      data['storyExplaination'] = this.storyExplaination!.toJson();
    }
    data['summary'] = this.summary;
    if (this.questions != null) {
      data['questions'] = this.questions!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class StoryExplaination {
  String? beleif;
  String? evidence;

  StoryExplaination({this.beleif, this.evidence});

  StoryExplaination.fromJson(Map<String, dynamic> json) {
    beleif = json['beleif'];
    evidence = json['evidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beleif'] = this.beleif;
    data['evidence'] = this.evidence;
    return data;
  }
}

class Questions {
  List<StoryQuestions>? storyQuestions;
  List<StoryQuestions>? testUnderstandingQuestions;
  List<StoryQuestions>? practiceQuestions;

  Questions(
      {this.storyQuestions,
      this.testUnderstandingQuestions,
      this.practiceQuestions});

  Questions.fromJson(Map<String, dynamic> json) {
    if (json['storyQuestions'] != null) {
      storyQuestions = <StoryQuestions>[];
      json['storyQuestions'].forEach((v) {
        storyQuestions!.add(new StoryQuestions.fromJson(v));
      });
    }
    if (json['testUnderstandingQuestions'] != null) {
      testUnderstandingQuestions = <StoryQuestions>[];
      json['testUnderstandingQuestions'].forEach((v) {
        testUnderstandingQuestions!
            .add(new StoryQuestions.fromJson(v));
      });
    }
    if (json['practiceQuestions'] != null) {
      practiceQuestions = <StoryQuestions>[];
      json['practiceQuestions'].forEach((v) {
        practiceQuestions!.add(new StoryQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storyQuestions != null) {
      data['storyQuestions'] =
          this.storyQuestions!.map((v) => v.toJson()).toList();
    }
    if (this.testUnderstandingQuestions != null) {
      data['testUnderstandingQuestions'] =
          this.testUnderstandingQuestions!.map((v) => v.toJson()).toList();
    }
    if (this.practiceQuestions != null) {
      data['practiceQuestions'] =
          this.practiceQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoryQuestions {
  String? sId;
  String? lesson;
  String? question;
  List<String>? options;
  String? answer;
  int? iV;

  StoryQuestions(
      {this.sId,
      this.lesson,
      this.question,
      this.options,
      this.answer,
      this.iV});

  StoryQuestions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lesson = json['lesson'];
    question = json['question'];
    options = json['options'].cast<String>();
    answer = json['answer'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lesson'] = this.lesson;
    data['question'] = this.question;
    data['options'] = this.options;
    data['answer'] = this.answer;
    data['__v'] = this.iV;
    return data;
  }
  
}
