import 'package:flutter/material.dart';
import '../widgets/heading.dart';
import '../widgets/option.dart';
import '../controllers/quiz_controller.dart';
import '../services/request.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  QuizController mainController = QuizController(req: Request());
  var pointCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Dev Challenge - ChargeLab",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Heading(text: 'Answer Questions to Earn Points \n Current Points: $pointCounter'),
          Heading(
            key: ValueKey('question'),
            text: mainController.currentQuestion.text,
            size: 24
            ),
          ...Request.shuffle(mainController.currentQuestion.options).map((option) {
              return Option(() { 
                setState(() {
                  pointCounter = mainController.checkAnswer(option) ? pointCounter + 1 : pointCounter - 1;
                  mainController.setQuestion();
                });
              },
              text: option
            );
          }),
        ],
      )
    );
  }
}