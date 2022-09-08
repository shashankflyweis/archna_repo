class DistortionModel {
  final int? id, answer;
  final String? question;
  final List<String>? options;
  final String? answershow;

  DistortionModel(
      {this.id, this.question, this.answer, this.options, this.answershow});
}

const List distortionmodeldata = [
  {
    "id": 1,
    "question":
        "In this situation, do you think Meera’s thoughts fall under the category of Catastrophizing?",
    "options": ['Yes', 'No'],
    "answer_index": 0,
    "answershow":
        "Yes indeed it does! Meera is making a big deal about almost nothing. When anyone exercises for the first time or after a long gap, it takes time to get back to it. The first attempt may not be what we are expecting but eventually, we can get to where we want to! It really wasn’t a situation where they needed to simply give up"
  },
];
