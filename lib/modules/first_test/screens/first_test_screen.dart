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
  List<FirstTestModel> answers = [];
  int currentProgress = 1;
  int totalProgress = 4;
  bool isComplete = false;
  int numberOfCorrectAnswer = 0;
  int totalOfCorrectAnswer = 0;
  @override
  void initState() {
    answers = [
      FirstTestModel(answer: 'Fast', isChecked: false, isCorrect: true),
      FirstTestModel(answer: 'Slow', isChecked: false),
      FirstTestModel(answer: 'Lazy', isChecked: false),
      FirstTestModel(answer: 'Dull', isChecked: false),
      FirstTestModel(answer: 'Rapid', isChecked: false, isCorrect: true),
    ];

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
              'What is the synonym of "quick"?',
              style: textTheme.bodyMedium!.copyWith(
                color: AppColor.c_FF64748B,
                fontWeight: FontWeight.w300,
              ),
            ),
            spaceH24,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => spaceH16,
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  final item = answers[index];
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
                          Text(item.answer ?? '', style: textTheme.bodyLarge),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              title: 'Tiếp tục',
              isEnable: answers.any((e) => e.isChecked),
              onTap: () => setState(() {
                totalOfCorrectAnswer +=
                    answers.where((element) => element.isCorrect).length;
                numberOfCorrectAnswer += answers
                    .where((element) => element.isChecked && element.isCorrect)
                    .length;
                if (currentProgress < totalProgress) {
                  currentProgress++;
                  answers.forEach((element) {
                    element.isChecked = false;
                  });
                } else {
                  isComplete = true;
                  Future.delayed(Duration(seconds: 3), () {
                    GoRouter.of(context).push(AppPath.firstTestResult);
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
