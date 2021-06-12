import 'package:trivia/entities/option.dart';

class Question {
  final String question;
  final List<dynamic> options;
  bool isLocked;
  dynamic selectedOption;

  Question(this.question, this.options, {this.isLocked = false});
  factory Question.fromJson(dynamic json) {
    if (json['options'] != null) {
      var optionJson = json['options'] as List;
      List<Option> _options = optionJson
          .map(
            (option) => Option(
              text: option['text'],
              option: option['option'],
              isCorrect: (option['isCorrect'] == 'true'),
            ),
          )
          .toList();
      print(_options);
      return Question(json['question'] as String, _options);
    } else
      throw Exception(['ghdjh']);
  }
}
