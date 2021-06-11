import 'package:flutter/material.dart';
import 'package:trivia/entities/question.dart';
import 'package:trivia/screens/quiz_screen/widgets/OptionsWidget.dart';

import 'widgets/QuestionCard.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List sampleData = [
    {
      "id": 1,
      "question": "question 1",
      "options": [
        {'option': '1', 'text': 'sadasd', 'isCorrect': true},
        {'option': '2', 'text': 'sadasd', 'isCorrect': false},
        {'option': '3', 'text': 'sadasd', 'isCorrect': false}
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
  @override
  Widget build(BuildContext context) {
    List<Question> _questions =
        sampleData.map((question) => Question.fromJson(question)).toList();

    var j = i + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('sam quiz'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Text.rich(
                TextSpan(
                    text: 'question ${j}',
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
              QuestionCard(param: _questions[i].question),
              Expanded(
                  child: OptionsWidget(
                question: _questions[i],
              )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (j < _questions.length) {
                        i++;
                        print(i);
                      } else {
                        print('last one');
                      }
                      ;
                    });
                  },
                  icon: const Icon(Icons.skip_next))
            ],
          )
        ],
      ),
    );
  }
}
