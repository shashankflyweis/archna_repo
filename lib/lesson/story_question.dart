import 'package:archna_frontend/View/model/story_question_model.dart';
import 'package:archna_frontend/constant/contant.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class StoryQuestion extends StatefulWidget {
  StoryQuestion({Key? key}) : super(key: key);

  @override
  State<StoryQuestion> createState() => _StoryQuestionState();
}

class _StoryQuestionState extends State<StoryQuestion> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  bool rt = false;

  // bool selectedAnswe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themAppcolor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            6.h.heightBox,
            Row(
              children: [
                Image.asset(
                  "assets/images/canimg.png",
                ),
                3.w.widthBox,
                Container(
                  width: 84.w,
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 10,
                    size: 8,
                    padding: 0,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.grey,
                    roundedEdges: Radius.circular(10),
                  ),
                ),
              ],
            ),
            4.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.black)),
              ],
            ),
            2.h.heightBox,
            Text(
              // "Questions ${_questionIndex + 1}/${(_questions.length.toString())}",
              "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
              style: text21,
            ),
            3.h.heightBox,
            Container(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text(
                      questionList[currentQuestionIndex].QuestionText,
                      style: text21,
                    ),
                    5.h.heightBox,
                    _answerList(),
                    2.h.heightBox,
                    _nextButton(),
                    2.h.heightBox,
                  ],
                ).pSymmetric(h: 2.h, v: 2.h),
              ),
            ),
          ],
        ).pSymmetric(h: 2.h));
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    bool isSelectede = answer != selectedAnswer;
    bool isSelecteda = true;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.green : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (answer.isCorrect) {
            score++;
            setState(() {
              selectedAnswer = answer;
              isSelecteda = false;
            });
            if (isSelectede != answer) {
              Colors.orange;
            }
          }
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Center(
      child: InkWell(
        onTap: () {
          if (isLastQuestion) {
            // Get.to(SchoolTimeStory());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
              // selectedAnswe = Colors.red as bool;
            });
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          height: 8.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15.sp)),
          child: Center(
            child: Text(
              isLastQuestion ? "Submit" : "Next",
              style: text22,
            ),
          ),
        ),
      ),
    );
  }
}
