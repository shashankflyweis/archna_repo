class AnxietyModel {
  final int? id, answer;
  final String? question;
  final String? title;
  final List<String>? options;
  // final String? answershow;

  AnxietyModel({
    this.id,
    this.question,
    this.answer,
    this.title,
    this.options,
    // this.answershow
  });
}

const List AnxietyData = [
  {
    "id": 1,
    "title": "Do you have",
    "question": "Little interest or pleasure in doing things?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
    // "answershow":
    //     "Our beliefs certainly play a role in how we perceive situations as threatening or nonthreatening, good or bad. But we can choose to not be affected by them by remaining committed to truth."
  },
  {
    "id": 2,
    "title": "Are you",
    "question": "Feeling down, depressed, or hopeless?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "title": "Do you have",
    "question": "Trouble falling or staying asleep, or sleeping too much?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "title": "Are you",
    "question": "Feeling tired or having little energy?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "title": "Do you have a",
    "question": "Poor appetite or overeating?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 6,
    "title": "Are you",
    "question":
        "Feeling bad about yourself - or that you are a failure or have let yourself or your family down?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 7,
    "title": "Do you have",
    "question":
        "Trouble concentrating on things, such as reading the newspaper or watching television?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 8,
    "title": "Are you",
    "question":
        "Moving or speaking so slowly that other people could have noticed?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
  {
    "id": 9,
    "title": "Are you having",
    "question":
        "Thoughts that you would be better off dead, or of hurting yourself in some way?",
    "options": [
      'Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day'
    ],
    "answer_index": 1,
  },
];
