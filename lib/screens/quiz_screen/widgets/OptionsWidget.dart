import 'package:flutter/material.dart';
import 'package:trivia/entities/option.dart';
import 'package:trivia/entities/question.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList());
  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(
          5,
        ),
        child: buildAnswer(option),
      ),
    );
  }

  Widget buildAnswer(Option option) => Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                option.option,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(option.text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade600)),
            )
          ],
        ),
      );
}

Color getColorForOption(Option option, Question question) {
  if (question.selectedOption != null) {
    final isSelected = option == question.selectedOption;
    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return option.isCorrect ? Colors.green : Colors.red;
    }
  } else
    return Colors.grey.shade200;
}
