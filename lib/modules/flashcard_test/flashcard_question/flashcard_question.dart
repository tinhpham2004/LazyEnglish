import 'package:json_annotation/json_annotation.dart';

class FlashcardQuestion {
  final String? question;
  final List<String>? choices;
  final String? answerKey;

  FlashcardQuestion({
    this.question,
    this.choices,
    this.answerKey,
  });

  factory FlashcardQuestion.fromJson(Map<String, dynamic> json) {
    return FlashcardQuestion(
      question: json['question'],
      choices: List<String>.from(json['choices']),
      answerKey: json['answer_key'],
    );
  }
}
