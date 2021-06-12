import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.param}) : super(key: key);
  final String param;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(
        5,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              param,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
