import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/button/app_button.dart';
import 'package:lazy_english/core/widgets/container/app_container.dart';
import 'package:lazy_english/core/widgets/progress_bar/app_progress_bar.dart';
import 'package:lazy_english/modules/first_test/models/first_test_model.dart';
import 'package:lazy_english/router/app_path.dart';

class FirstTestScreen extends StatefulWidget {
  FirstTestScreen({Key? key}) : super(key: key);

  @override
  State<FirstTestScreen> createState() => _FirstTestScreenState();
}

class _FirstTestScreenState extends State<FirstTestScreen> {
  final jsonString = '''
{
    "questions": [
        {
            "id": 1,
            "question": "What are the synonyms of 'happy'?",
            "choices": [
                "Sad",
                "Joyful",
                "Angry",
                "Content"
            ],
            "answer_keys": [
                "Joyful",
                "Content"
            ],
            "points": 10
        },
        {
            "id": 2,
            "question": "Which sentences are grammatically correct?",
            "choices": [
                "He go to school every day.",
                "He goes to school every day.",
                "He going to school every day.",
                "He has gone to school every day."
            ],
            "answer_keys": [
                "He goes to school every day.",
                "He has gone to school every day."
            ],
            "points": 10
        },
        {
            "id": 3,
            "question": "Choose the correct past tense form:",
            "choices": [
                "He walk to the park yesterday.",
                "He walked to the park yesterday.",
                "He walking to the park yesterday.",
                "He walks to the park yesterday."
            ],
            "answer_keys": [
                "He walked to the park yesterday."
            ],
            "points": 5
        },
        {
            "id": 4,
            "question": "Identify the adjectives in the following sentence: 'The big brown dog barked loudly.'",
            "choices": [
                "big",
                "brown",
                "dog",
                "loudly"
            ],
            "answer_keys": [
                "big",
                "brown"
            ],
            "points": 10
        },
        {
            "id": 5,
            "question": "What are the antonyms of 'difficult'?",
            "choices": [
                "Hard",
                "Easy",
                "Simple",
                "Complicated"
            ],
            "answer_keys": [
                "Easy",
                "Simple"
            ],
            "points": 10
        },
        {
            "id": 6,
            "question": "Select the correctly spelled words:",
            "choices": [
                "Accomodation",
                "Accommodation",
                "Recieve",
                "Receive"
            ],
            "answer_keys": [
                "Accommodation",
                "Receive"
            ],
            "points": 5
        },
        {
            "id": 7,
            "question": "Which sentences use correct punctuation?",
            "choices": [
                "Where are you going?",
                "I am going to the park",
                "Do you want to come.",
                "Let's go together!"
            ],
            "answer_keys": [
                "Where are you going?",
                "Let's go together!"
            ],
            "points": 5
        },
        {
            "id": 8,
            "question": "Choose the correct word to complete the sentence: 'I need to ____ some milk from the store.'",
            "choices": [
                "buy",
                "by",
                "bye",
                "bee"
            ],
            "answer_keys": [
                "buy"
            ],
            "points": 5
        },
        {
            "id": 9,
            "question": "What are examples of proper nouns?",
            "choices": [
                "city",
                "London",
                "dog",
                "Michael"
            ],
            "answer_keys": [
                "London",
                "Michael"
            ],
            "points": 10
        },
        {
            "id": 10,
            "question": "Identify the correct plural forms:",
            "choices": [
                "Childs",
                "Children",
                "Mouses",
                "Mice"
            ],
            "answer_keys": [
                "Children",
                "Mice"
            ],
            "points": 10
        },
        {
            "id": 11,
            "question": "Which phrases are idioms?",
            "choices": [
                "Break the ice",
                "Kick the bucket",
                "Drink water",
                "Take a seat"
            ],
            "answer_keys": [
                "Break the ice",
                "Kick the bucket"
            ],
            "points": 10
        },
        {
            "id": 12,
            "question": "Choose the correct comparative forms of 'good':",
            "choices": [
                "gooder",
                "better",
                "best",
                "more good"
            ],
            "answer_keys": [
                "better"
            ],
            "points": 5
        },
        {
            "id": 13,
            "question": "Which words are homophones?",
            "choices": [
                "Their",
                "There",
                "They're",
                "Theirs"
            ],
            "answer_keys": [
                "Their",
                "There",
                "They're"
            ],
            "points": 10
        },
        {
            "id": 14,
            "question": "Select the correct uses of articles:",
            "choices": [
                "I saw a apple.",
                "I saw an apple.",
                "She is a teacher.",
                "She is teacher."
            ],
            "answer_keys": [
                "I saw an apple.",
                "She is a teacher."
            ],
            "points": 5
        },
        {
            "id": 15,
            "question": "What are examples of conjunctions?",
            "choices": [
                "and",
                "but",
                "run",
                "because"
            ],
            "answer_keys": [
                "and",
                "but",
                "because"
            ],
            "points": 10
        },
        {
            "id": 16,
            "question": "Identify the verbs in the sentence: 'She quickly writes a letter and sends it.'",
            "choices": [
                "quickly",
                "writes",
                "letter",
                "sends"
            ],
            "answer_keys": [
                "writes",
                "sends"
            ],
            "points": 10
        },
        {
            "id": 17,
            "question": "Which sentences are in passive voice?",
            "choices": [
                "The cake was eaten by the children.",
                "The children ate the cake.",
                "The book is being read by her.",
                "She is reading the book."
            ],
            "answer_keys": [
                "The cake was eaten by the children.",
                "The book is being read by her."
            ],
            "points": 10
        },
        {
            "id": 18,
            "question": "What are examples of interjections?",
            "choices": [
                "Oh!",
                "Wow!",
                "Run",
                "Quietly"
            ],
            "answer_keys": [
                "Oh!",
                "Wow!"
            ],
            "points": 5
        },
        {
            "id": 19,
            "question": "Which words can complete the sentence: 'The weather today is very ____.'",
            "choices": [
                "cold",
                "rains",
                "beautiful",
                "run"
            ],
            "answer_keys": [
                "cold",
                "beautiful"
            ],
            "points": 5
        },
        {
            "id": 20,
            "question": "Select the correct prepositions to complete the sentence: 'He is ____ the park.'",
            "choices": [
                "in",
                "on",
                "at",
                "to"
            ],
            "answer_keys": [
                "in",
                "at"
            ],
            "points": 5
        }
    ]
}
''';

  List<FirstTestModel> questions = [];
  int currentProgress = 1;
  int totalProgress = 0;
  bool isComplete = false;
  int totalPoint = 0;
  int numberOfCorrectAnswer = 0;
  int totalOfCorrectAnswer = 0;
  @override
  void initState() {
    questions = (jsonDecode(jsonString)['questions'] as List<dynamic>)
        .map<FirstTestModel>((e) => FirstTestModel.fromJson(e))
        .toList();
    totalProgress = questions.length;
    totalOfCorrectAnswer = questions.fold(0,
        (previousValue, element) => previousValue + element.answerKeys.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isComplete) {
      return Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Great picks! We\'re finding best\nLevel for you!',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                spaceH32,
                AppProgressBar(
                  title:
                      '${numberOfCorrectAnswer * 100 ~/ totalOfCorrectAnswer}%',
                  value: numberOfCorrectAnswer / totalOfCorrectAnswer,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: AppIcon.arrowLeft,
          onPressed: () => GoRouter.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppProgressBar(
          title: '$currentProgress/$totalProgress',
          value: currentProgress / totalProgress,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question',
              style: textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            spaceH8,
            Text(
              questions[currentProgress - 1].question ?? '',
              style: textTheme.bodyMedium!.copyWith(
                color: AppColor.c_FF64748B,
                fontWeight: FontWeight.w300,
              ),
            ),
            spaceH24,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => spaceH16,
                itemCount: questions[currentProgress - 1].choices.length,
                itemBuilder: (context, index) {
                  final item = questions[currentProgress - 1].choices[index];
                  return AppContainer(
                    isSelected: item.isChecked,
                    child: CheckboxListTile(
                      fillColor: item.isChecked
                          ? MaterialStateProperty.all(AppColor.c_FF2970FF)
                          : null,
                      value: item.isChecked,
                      onChanged: (value) {
                        setState(() {
                          item.isChecked = value!;
                        });
                      },
                      title:
                          Text(item.choice ?? '', style: textTheme.bodyLarge),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
            spaceH16,
            AppButton(
              title: 'Tiếp tục',
              isEnable: questions[currentProgress - 1]
                  .choices
                  .any((e) => e.isChecked),
              onTap: () => setState(() {
                // numberOfCorrectAnswer += answers
                //     .where((element) => element.isChecked && element.isCorrect)
                //     .length;
                for (int i = 0;
                    i < questions[currentProgress - 1].choices.length;
                    i++) {
                  if (questions[currentProgress - 1].choices[i].isChecked &&
                      questions[currentProgress - 1].answerKeys.contains(
                          questions[currentProgress - 1].choices[i].choice)) {
                    numberOfCorrectAnswer++;
                    totalPoint += (questions[currentProgress - 1].points ??
                            0) ~/
                        (questions[currentProgress - 1].answerKeys.isEmpty
                            ? 1
                            : questions[currentProgress - 1].answerKeys.length);
                  }
                }
                if (currentProgress < totalProgress) {
                  currentProgress++;
                } else {
                  isComplete = true;
                  Future.delayed(Duration(seconds: 3), () {
                    GoRouter.of(context)
                        .push(AppPath.firstTestResult, extra: totalPoint);
                  });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
