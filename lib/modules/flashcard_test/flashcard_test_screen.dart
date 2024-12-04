import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/appbar/appbar.dart';
import 'package:lazy_english/core/widgets/button/app_button.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/modules/flashcard_test/flashcard_question/flashcard_question.dart';

class FlashcardTestScreen extends StatefulWidget {
  const FlashcardTestScreen({super.key});

  @override
  State<FlashcardTestScreen> createState() => _FlashcardTestScreenState();
}

class _FlashcardTestScreenState extends State<FlashcardTestScreen> {
  final jsonString = '''
{
    "questions": [
        {
            "question": "using very few words",
            "choices": [
                "laconic",
                "verbose",
                "gregarious",
                "magnanimous"
            ],
            "answer_key": "laconic"
        },
        {
            "question": "friendly, sociable, and outgoing",
            "choices": [
                "gregarious",
                "laconic",
                "esoteric",
                "ephemeral"
            ],
            "answer_key": "gregarious"
        },
        {
            "question": "secretive or intended for a small group of people with specialized knowledge",
            "choices": [
                "esoteric",
                "benevolent",
                "magnanimous",
                "gregarious"
            ],
            "answer_key": "esoteric"
        },
        {
            "question": "generous or forgiving, especially toward a rival or less powerful person",
            "choices": [
                "magnanimous",
                "laconic",
                "ephemeral",
                "cogent"
            ],
            "answer_key": "magnanimous"
        },
        {
            "question": "having or showing a wish to do evil to others",
            "choices": [
                "malevolent",
                "gregarious",
                "meticulous",
                "serendipity"
            ],
            "answer_key": "malevolent"
        },
        {
            "question": "extremely unpleasant or disgusting",
            "choices": [
                "abhorrent",
                "laconic",
                "serendipity",
                "benevolent"
            ],
            "answer_key": "abhorrent"
        },
        {
            "question": "exceedingly idealistic; unrealistic and impractical",
            "choices": [
                "quixotic",
                "meticulous",
                "laconic",
                "cogent"
            ],
            "answer_key": "quixotic"
        },
        {
            "question": "occurring at irregular intervals; not continuous or steady",
            "choices": [
                "intermittent",
                "serendipity",
                "gregarious",
                "laconic"
            ],
            "answer_key": "intermittent"
        },
        {
            "question": "acting or done quickly and without thought or care",
            "choices": [
                "impetuous",
                "benevolent",
                "ephemeral",
                "magnanimous"
            ],
            "answer_key": "impetuous"
        },
        {
            "question": "lacking originality or freshness; dull on account of overuse",
            "choices": [
                "banal",
                "esoteric",
                "meticulous",
                "gregarious"
            ],
            "answer_key": "banal"
        },
        {
            "question": "showing a casual and cheerful indifference considered to be improper",
            "choices": [
                "blithe",
                "laconic",
                "malevolent",
                "abhorrent"
            ],
            "answer_key": "blithe"
        },
        {
            "question": "making a show of being morally superior to others",
            "choices": [
                "sanctimonious",
                "laconic",
                "impetuous",
                "serendipity"
            ],
            "answer_key": "sanctimonious"
        },
        {
            "question": "involving or requiring strenuous effort; difficult and tiring",
            "choices": [
                "arduous",
                "benevolent",
                "quixotic",
                "gregarious"
            ],
            "answer_key": "arduous"
        },
        {
            "question": "relating to or affecting cattle",
            "choices": [
                "bovine",
                "serendipity",
                "laconic",
                "esoteric"
            ],
            "answer_key": "bovine"
        },
        {
            "question": "expressing contempt or ridicule",
            "choices": [
                "derisive",
                "benevolent",
                "ephemeral",
                "gregarious"
            ],
            "answer_key": "derisive"
        }
    ]
}
''';

  List<FlashcardQuestion> questions = [];
  int currentIndex = 0;
  int? currentSelectedChoice;

  @override
  void initState() {
    questions = (jsonDecode(jsonString)['questions'] as List<dynamic>)
        .map((question) => FlashcardQuestion.fromJson(question))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: Appbar(
        title: Text(
          '${currentIndex + 1}/${questions.length}',
          style: textTheme.titleMedium,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                spaceH16,
                Text(
                  questions[currentIndex].question ?? '',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              children: [
                for (int i = 0;
                    i < questions[currentIndex].choices!.length;
                    i++) ...[
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentSelectedChoice = i;
                      });
                      if (questions[currentIndex].answerKey ==
                          questions[currentIndex].choices![i]) {
                        showCorrectAnswerDialog();
                      } else {
                        showWrongAnswerDialog();
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentSelectedChoice == i
                              ? AppColor.c_FF2970FF
                              : AppColor.c_FFE2E8F0,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.only(left: 8.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        questions[currentIndex].choices![i],
                        style: textTheme.bodyLarge!,
                      ),
                    ),
                  ),
                  spaceH16,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showCorrectAnswerDialog() {
    showDialog(
      context: context,
      barrierColor: AppColor.c_FF101828.withOpacity(0.2),
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.c_FFE2E8F0,
              ),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceH16,
                Assets.images.like.image(),
                spaceH8,
                Text(
                  'Chính xác 😍',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColor.c_FF16A34A,
                  ),
                ),
                spaceH8,
                Text(
                  questions[currentIndex].answerKey ?? '',
                  style: textTheme.titleMedium!.copyWith(),
                ),
                spaceH8,
                Text(
                  questions[currentIndex].question ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.c_FF64748B,
                  ),
                ),
                spaceH8,
                Text(
                  'Đáp án Đúng',
                  style: textTheme.titleMedium!.copyWith(),
                ),
                spaceH16,
                Divider(),
                spaceH8,
                AppButton(
                  title: 'Tiếp tục',
                  isMargin: false,
                  onTap: () {
                    if (currentIndex < questions.length - 1) {
                      setState(() {
                        currentIndex++;
                        currentSelectedChoice = null;
                      });
                    }
                    GoRouter.of(context).pop();
                  },
                ),
                spaceH8,
              ],
            ),
          ),
        );
      },
    );
  }

  void showWrongAnswerDialog() {
    showDialog(
      context: context,
      barrierColor: AppColor.c_FF101828.withOpacity(0.2),
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.c_FFE2E8F0,
              ),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceH16,
                Assets.images.chaos.image(),
                spaceH8,
                Text(
                  'Sai rồi học lại! 😅',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColor.c_FFD92D20,
                  ),
                ),
                spaceH8,
                Text(
                  'Từ đúng',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.c_FF16A34A,
                  ),
                ),
                spaceH8,
                Text(
                  questions[currentIndex].answerKey ?? '',
                  style: textTheme.titleMedium!.copyWith(),
                ),
                spaceH8,
                Text(
                  'Bạn chọn',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.c_FFD92D20,
                  ),
                ),
                spaceH8,
                Text(
                  questions[currentIndex].choices![currentSelectedChoice!],
                  style: textTheme.titleMedium!.copyWith(),
                ),
                spaceH16,
                Divider(),
                spaceH8,
                AppButton(
                  title: 'Tiếp tục',
                  isMargin: false,
                  onTap: () => GoRouter.of(context).pop(),
                ),
                spaceH8,
              ],
            ),
          ),
        );
      },
    );
  }
}
