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
      "question": "How many seasons of Friends are there?",
      "options": [
        {'option': '1', 'text': '10', 'isCorrect': 'true'},
        {'option': '2', 'text': '11', 'isCorrect': 'false'},
        {'option': '3', 'text': '9', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 2,
      "question": "Joey played Dr. Drake Ramoray on which soap opera show?",
      "options": [
        {'option': '1', 'text': 'The Doctors', 'isCorrect': 'false'},
        {'option': '2', 'text': 'Days of Our Lives', 'isCorrect': 'true'},
        {'option': '3', 'text': 'General Hospital', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 3,
      "question":
          "Brad Pitt and David Schwimmer’s characters cofounded what club in high school?",
      "options": [
        {
          'option': '1',
          'text': 'I Hate Rachel Green Club',
          'isCorrect': 'true'
        },
        {
          'option': '2',
          'text': 'I Hate Color Green Club',
          'isCorrect': 'false'
        },
        {'option': '3', 'text': 'Chess Club', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 4,
      "question": "Which of Joey’s sisters did Chandler fool around with?",
      "options": [
        {'option': '1', 'text': 'Mary Teresa', 'isCorrect': 'false'},
        {'option': '2', 'text': 'Mary Jane', 'isCorrect': 'false'},
        {'option': '3', 'text': 'Mary Angela', 'isCorrect': 'true'}
      ],
    },
    {
      "id": 5,
      "question": "Joey and Chandler’s TV guide is addressed to who?",
      "options": [
        {'option': '1', 'text': 'Miss Chanandler Bong.', 'isCorrect': 'true'},
        {'option': '2', 'text': 'Mr Chanandler Bong.', 'isCorrect': 'false'},
        {'option': '3', 'text': 'Mary Angela', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 6,
      "question": "According to Monica, a woman has how many erogenous zones?",
      "options": [
        {'option': '1', 'text': '3', 'isCorrect': 'false'},
        {'option': '2', 'text': '5', 'isCorrect': 'false'},
        {'option': '3', 'text': '7', 'isCorrect': 'true'}
      ],
    },
    {
      "id": 7,
      "question": "How many sisters does Joey have?",
      "options": [
        {'option': '1', 'text': '6', 'isCorrect': 'false'},
        {'option': '2', 'text': '7', 'isCorrect': 'true'},
        {'option': '3', 'text': '9', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 8,
      "question": "Who was (accidentally) Monica’s first kiss?",
      "options": [
        {'option': '1', 'text': 'Richard ', 'isCorrect': 'false'},
        {'option': '2', 'text': 'Rachel', 'isCorrect': 'false'},
        {'option': '3', 'text': 'Ross', 'isCorrect': 'true'}
      ],
    },
    {
      "id": 9,
      "question": "Rachel goes on Ross’ honeymoon by herself where?",
      "options": [
        {'option': '1', 'text': 'Athens, Greece', 'isCorrect': 'true'},
        {'option': '2', 'text': 'Paris, Franch', 'isCorrect': 'false'},
        {'option': '3', 'text': 'London, Uk', 'isCorrect': 'false'}
      ],
    },
    {
      "id": 10,
      "question": "Which character famously said, “PIVOT”?",
      "options": [
        {'option': '1', 'text': 'Joey', 'isCorrect': 'false'},
        {'option': '2', 'text': 'Monica', 'isCorrect': 'false'},
        {'option': '3', 'text': 'Ross', 'isCorrect': 'true'}
      ],
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
        title: Text('know your F.R.I.E.N.D.S quiz'),
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
              QuestionCard(question: currentQuestion.question),
              Expanded(
                  //will display all available options
                  child: OptionsWidget(
                      question: currentQuestion,
                      onClickedOption: selectOption)),
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
                  title: Text("game ended your score is " +
                      score.toString() +
                      "/" +
                      questions.length.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            currentQuestion = null;
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          "play again",
                          style: TextStyle(color: Colors.blue),
                        ))
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
      //calls next question after 1 secoends
      //can be changed later to a dinamic int for faster or slower time
      //depends if user correct or not
      Future.delayed(Duration(seconds: 1), () {
        nextQuestion();
      });
    }
  }
}
