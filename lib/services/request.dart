import '../models/question.dart';
import 'dart:math';

var questions = [
  QuestionModel(
    'what does php stand for?',
    ['private home page', 'hypertext preprocessor', 'personal hypertext processor'],
    'hypertext preprocessor'
  ),
  QuestionModel(
    'php server scripts are surrounded by which delimiters?',
    ['<script>...</script>', '<?php>...</?>', '<&>...</&>', '<?php...?>'],
    '<?php...?>'
  ),
  QuestionModel(
    'How do you write "Hello World" in php',
    ['echo "Hello World"', '"Hello World"', 'Document.Write("Hello World")'],
    'echo "Hello World"'
  ),
  QuestionModel(
    'all variables in php start with which symbol?',
    ['\$', '&', '!'],
    '\$'
  ),
  QuestionModel(
    'what is the correct way to end a php statement?',
    ['new line', '</php>', '.', ';'],
    ';'
  )
];

class Request {
  static List shuffle(List list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
    return list;
  }

  Future<QuestionModel> makeRequest() async {
    try {
      print('Requesting new question from database or server...');
      var question = shuffle(questions)[0];
      return question;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}