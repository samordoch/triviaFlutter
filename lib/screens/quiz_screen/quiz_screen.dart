import 'package:flutter/material.dart';
import 'package:trivia/entities/question.dart';

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
      "options": ['1', '2', '3', '4'],
      "answer_index": 1,
    },
    {
      "id": 2,
      "question": "question 2",
      "options": ['1', '2', '3', '4'],
      "answer_index": 1,
    },
    {
      "id": 3,
      "question": "question 3",
      "options": ['1', '2', '3', '4'],
      "answer_index": 1,
    },
    {
      "id": 4,
      "question": "question 4",
      "options": ['1', '2', '3', '4'],
      "answer_index": 1,
    },
  ];
  var i = 0;
  @override
  Widget build(BuildContext context) {
    List<Question> _questions = sampleData
        .map(
          (question) => Question(
              id: question['id'],
              question: question['question'],
              options: question['options'],
              answer: question['answer_index']),
        )
        .toList();

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
