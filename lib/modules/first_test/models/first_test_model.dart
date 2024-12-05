import 'package:lazy_english/modules/first_test/models/first_test_choice_model.dart';

class FirstTestModel {
  int? id;
  String? question;
  List<FirstTestChoiceModel> choices;
  List<String> answerKeys;
  int? points;

  FirstTestModel({
    this.id,
    this.question,
    this.choices = const [],
    this.answerKeys = const [],
    this.points,
  });

  factory FirstTestModel.fromJson(Map<String, dynamic> json) {
    return FirstTestModel(
      id: json['id'],
      question: json['question'],
      choices: List<FirstTestChoiceModel>.from(
        (json['choices'] as List<dynamic>).map(
          (choice) => FirstTestChoiceModel(
            isChecked: false,
            choice: choice,
          ),
        ),
      ),
      answerKeys: List<String>.from(json['answer_keys']),
      points: json['points'],
    );
  }
}
