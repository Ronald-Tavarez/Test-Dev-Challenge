// Implement a new widget
// Create a new Unit test to validate your functionality


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_dev/controllers/quiz_controller.dart';
import 'package:test_dev/models/question.dart';
import 'package:test_dev/services/request.dart';

class MockRequest extends Mock implements Request {}

void main() {
  MockRequest mockReq = MockRequest();
  QuizController quizController;
  setUp(() {
     quizController = QuizController(req: mockReq);
  });
  
  test("Mock Request Call", () async {
    when(mockReq.makeRequest()).thenAnswer(
      (realInvocation) => Future.value(
        QuestionModel('Mock Generated', ['mock', 'real'], 'mock')
        ),
      );
    await quizController.requestQuestion();
    expect(quizController.currentQuestion.text, 'Mock Generated');
  });

  test("Returns proper result on valid entry", () {
    expect(quizController.checkAnswer(quizController.currentQuestion.answer), true);
  });

  test("Returns proper result on invalid entry", () {
    expect(quizController.checkAnswer("h1.r'3m3-p/_e@s3,k/k/;)"), false);
  });
}
