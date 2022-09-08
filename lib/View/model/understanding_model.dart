class UnderStandingModel1 {
  final int? id, answer;
  final String? question;
  final List<String>? options;
  final String? answershow;

  UnderStandingModel1(
      {this.id, this.question, this.answer, this.options, this.answershow});
}

const List underStandindData = [
  {
    "id": 1,
    "question": "We can choose not to be influenced by our beliefs.",
    "options": ['True', 'False'],
    "answer_index": 0,
    "answershow":
        "Our beliefs certainly play a role in how we perceive situations as threatening or nonthreatening, good or bad. But we can choose to not be affected by them by remaining committed to truth."
  },
  {
    "id": 2,
    "question": " What are the three ways we can respond to a situation?",
    "options": [
      'By trying to investigate the truth or finding evidence',
      'By following our negative beliefs like “it must be something harmful”',
      'By following our positive beliefs like “it must be only a tree branch moving”',
    ],
    "answer_index": 1,
    "answershow":
        "Our beliefs certainly play a role in how we perceive situations as threatening or nonthreatening, good or bad. But we can choose to not be affected by them by remaining committed to truth."
  },
];
