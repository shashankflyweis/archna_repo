import 'package:archna_frontend/View/Home/school_time_question/school_time_question.dart';
import 'package:archna_frontend/View/model/story_model_question.dart';
import 'package:archna_frontend/View/story/story_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

// We use get package for our state management

class QuestionController extends GetxController with StateMixin<Question> {
  // Lets animated our progress bar

  // AnimationController _animationController;
  // Animation _animation;
  // so that we can access our animation outside
  // Animation get animation => this._animation;
  var data3 = Get.arguments;

  PageController? _pageController;
  PageController? get pageController => _pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _correctAns;
  int? get correctAns => _correctAns;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // int step = 10;
  RxDouble _step = 6.25.obs;
  RxDouble get stepcount => _step;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    // _animationController =
    //     AnimationController(duration: Duration(seconds: 60), vsync: this);
    // _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
    //   ..addListener(() {
    //     // update like setState
    //     update();
    //   });

    // start our animation
    // Once 60s is completed go to the next qn
    // _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  // @override
  // void onClose() {
  //   super.onClose();
  //   // _animationController.dispose();
  //   _pageController?.dispose();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController?.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    // _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _correctAns = null;

      _pageController?.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      // _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      // _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(() => StoryPage(), arguments: stepcount.value + data3 + 6.25);
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
    _step.value = _step.value + 6.25;
  }
}
