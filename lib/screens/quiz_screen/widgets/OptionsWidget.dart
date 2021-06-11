import 'package:flutter/material.dart';
import 'package:trivia/entities/question.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;

  const OptionsWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList());
  Widget buildOption(BuildContext context, String option) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(
        5,
      ),
      child: buildAnswer(option),
    );
  }

  Widget buildAnswer(String option) => Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(option)],
        ),
      );
}
