import 'package:flutter/material.dart';
import 'package:trivia/entities/option.dart';
import 'package:trivia/entities/question.dart';
import 'package:trivia/screens/quiz_screen/widgets/OptionsWidget.dart';

import 'widgets/QuestionCard.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //in sampleData we have the json that build the questions list
  //this data can later be imported from an external Database or Api
  final List sampleData = [
    {
      "id": 1,
      "question": "question 1",
      "options": [
        {'option': '1', 'text': 'sadasd', 'isCorrect': 'true'},
        {'option': '2', 'text': 'sadasd', 'isCorrect': 'false'},
        {'option': '3', 'text': 'sadasd', 'isCorrect': 'false'}
      ],
      "answer_index": 1,
    },
    {
      "id": 2,
      "question": "מי כתב את האפליקציה",
      "options": [
        {'option': '1', 'text': 'sadasd', 'isCorrect': 'true'},
        {'option': '2', 'text': 'sadasd', 'isCorrect': 'false'},
        {'option': '3', 'text': 'sadasd', 'isCorrect': 'false'}
      ],
      "answer_index": 1,
    },
    {
      "id": 3,
      "question": "question 3",
      "options": [
        {'option': '1', 'text': 'sadasd', 'isCorrect': 'true'},
        {'option': '2', 'text': 'sadasd', 'isCorrect': 'false'},
        {'option': '3', 'text': 'sadasd', 'isCorrect': 'false'}
      ],
      "answer_index": 1,
    },
    {
      "id": 4,
      "question": "question 4",
      "options": [
        {'option': '1', 'text': 'sadasd', 'isCorrect': 'true'},
        {'option': '2', 'text': 'sadasd', 'isCorrect': 'false'},
        {'option': '3', 'text': 'sadasd', 'isCorrect': 'false'}
      ],
      "answer_index": 1,
    },
  ];
  var i = 0;
  var score = 0;
  late List<Question> questions;
  //we set currentQuestions to dynamic so it could be null untill data is loaded
  //this will be used later for restarting the test
  dynamic currentQuestion = null;

  @override
  Widget build(BuildContext context) {
    //this will build the questions list
    List<Question> _questions =
        sampleData.map((question) => Question.fromJson(question)).toList();
    setState(() {
      //we are checking to see if we have the start state
      if (currentQuestion == null) {
        if (_questions.isNotEmpty) {
          i = 0;
          score = 0;
          currentQuestion = _questions[i];
          questions = _questions;
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('sam quiz'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              //test progress
              Text.rich(
                TextSpan(
                    text: 'question ${i + 1}',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                      TextSpan(
                        text: '/${_questions.length}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
              ),
              Divider(
                thickness: 2,
              ),
              //current question
              QuestionCard(param: currentQuestion.question),
              Expanded(
                  //will display all available options
                  child: OptionsWidget(
                      question: currentQuestion,
                      onClickedOption: selectOption)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next))
            ],
          )
        ],
      ),
    );
  }

//this Function will call next question in the list until its end
//when no more questions left the function will call a dialog with score
  void nextQuestion() {
    setState(() {
      if (i + 1 < questions.length) {
        i++;
        currentQuestion = questions[i];
        print(i);
      } else {
        showDialog(
            context: context,
            builder: (a) => AlertDialog(
                  title: Text("game ended your score is " + score.toString()),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            currentQuestion = null;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("play again"))
                  ],
                ));
        print('game ended your score is ' + score.toString());
      }
    });
  }

  //this function will manage the selected option count score
  //and call next question automatcly
  void selectOption(Option option) {
    if (currentQuestion.isLocked) {
      print("option is locked");
      nextQuestion();
      print(option.option.toString());

      return;
    } else {
      setState(() {
        print("setting up state");
        currentQuestion.isLocked = true;
        currentQuestion.selectedOption = option;
        if (option.isCorrect) {
          score++;
        }
      });
      print(currentQuestion.isLocked);
      Future.delayed(Duration(seconds: 1), () {
        nextQuestion();
      });
    }
  }
}
