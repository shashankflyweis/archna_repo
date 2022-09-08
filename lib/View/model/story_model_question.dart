import 'package:archna_frontend/models/lesson.dart';
import 'package:archna_frontend/models/variables/service.dart';
import 'dart:convert';

class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

// int i = 0;
// int n = service.less.requiredLesson!.questions!.storyQuestions!.length.toInt();
// void main() {
//   for (; i < n; i++) {
//     sample_data.add(
//       {
//         "id": service.less.requiredLesson!.questions!.storyQuestions![i].iV
//             .toString(),
//         "question": service
//             .less.requiredLesson!.questions!.storyQuestions![i].question
//             .toString(),
//         "options": [
//           service.less.requiredLesson!.questions!.storyQuestions![i].options
//               .toString(),
//         ],
//         "answer_index": service
//             .less.requiredLesson!.questions!.storyQuestions![i].answer
//             .toString(),
//       },
//     );
//     i++;
//   }
// }
 List sample_data = [
  {
    "id": 1,
    "question": "What do you think really happened?",
    "options": [
      'There was a ghost or a scary animal in the tree',
      'There was perhaps wind blowing due to which the branch shook and caused the leaves to fall down',
      'There was a mouse living on the tree that just happened to jump across branches',
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What do you think really happened?",
    "options": [
      'There was a ghost or a scary animal in the tree',
      'There was perhaps wind blowing due to which the branch shook and caused the leaves to fall down',
      'There was a mouse living on the tree that just happened to jump across branches',
    ],
    "answer_index": 1,
  },
];
// List sample_data = List.generate(
//   service.less.requiredLesson!.questions!.storyQuestions!.length.toInt(),
//   (index) => ({
//     "id": service.less.requiredLesson!.questions!.storyQuestions![index].iV!
//         .toInt(),
//     "question": service
//         .less.requiredLesson!.questions!.storyQuestions![index].question
//         .toString(),
//     "options": 
//   (service.options[index]) 
//       // [service.less.requiredLesson!.questions!.storyQuestions![index].options
//       //     .toString().replaceAll(', ', '\',\'').replaceAll('[', '\'').replaceAll(']', '\'')+',' ]
  
//   ,
//     "answer_index": service
//         .less.requiredLesson!.questions!.storyQuestions![index].answer is int?service
//         .less.requiredLesson!.questions!.storyQuestions![index].answer:1
//         ,
//   }),
// );

