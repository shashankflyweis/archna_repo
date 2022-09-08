class PracticQuestionModel {
  final int? id, answer;
  final String? question;
  final List<String>? options;
  final String? answershow;

  PracticQuestionModel(
      {this.id, this.question, this.answer, this.options, this.answershow});
}

const List practicQuestionData = [
  {
    "id": 1,
    "question": "“I feel like I should have said something”",
    "options": ['Thought', 'Feeling'],
    "answer_index": 0,
    "answershow":
        "Even though the statement starts with I FEEL, this is a thought! This is because it is my opinion. "
  },
  {
    "id": 2,
    "question": "“I want to go away on a holiday”",
    "options": ['Thought', 'Feeling'],
    "answer_index": 0,
    "answershow": "This is a thought as it is my idea."
  },
  {
    "id": 2,
    "question":
        "“I feel stressed” Can you identify the feeling in this statement?",
    "options": ['Stressed', 'Free Feeling'],
    "answer_index": 0,
    "answershow": "The feeling here is “stressed”."
  },
];
