import 'package:trivia/entities/option.dart';

//question class
//require a string as the text and list of options
class Question {
  final String question;
  final List<dynamic> options;
  bool isLocked;
  dynamic selectedOption;

  Question(this.question, this.options, {this.isLocked = false});
  //json constractor
  factory Question.fromJson(dynamic json) {
    if (json['options'] != null) {
      var optionJson = json['options'] as List;
      //map the options arry to a list of option object
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
