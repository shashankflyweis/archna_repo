import 'package:archna_frontend/models/variables/service.dart';

class Question1 {
  String question;
  Question1({required this.question});
}

int i = 0;
int n = service.less.requiredLesson!.questions!.storyQuestions!.length;

void main() {
  for (; i < n; i++) {
    contents.add(Question1(
      question:
          "${service.less.requiredLesson!.questions!.storyQuestions![i].question}",
    ));
    i++;
  }
}

List<Question1> contents = [];
