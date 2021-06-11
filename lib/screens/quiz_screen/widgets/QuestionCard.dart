import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.param}) : super(key: key);
  final String param;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            param,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        color: Colors.grey,
      ),
    );
  }
}
