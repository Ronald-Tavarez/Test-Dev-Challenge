import '../models/question.dart';
import '../services/request.dart';

class QuizController {
  final Request req;
  QuestionModel currentQuestion = QuestionModel('Questions Appear Here', ['Click Me!'], 'Click Me!');

  QuizController({this.req}) {
  }


  bool checkAnswer(String answer) => (answer == currentQuestion.answer);

  Future<QuestionModel> requestQuestion() async {
    var newQuestion = currentQuestion;
    newQuestion = await req.makeRequest();
    return newQuestion;
  }

  void setQuestion() async {
    currentQuestion = await requestQuestion();
  }
}