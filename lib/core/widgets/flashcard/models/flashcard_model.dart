class FlashcardModel {
  final String? name;
  final String? ipa;
  final String? meaning;
  final String? example;

  FlashcardModel({
    this.name,
    this.ipa,
    this.meaning,
    this.example,
  });

  factory FlashcardModel.fromJson(Map<String, dynamic> json) {
    return FlashcardModel(
      name: json['name'],
      ipa: json['ipa'],
      meaning: json['meaning'],
      example: json['example'],
    );
  }
}
