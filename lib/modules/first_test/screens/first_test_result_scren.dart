import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/english_levels.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/button/app_button.dart';
import 'package:lazy_english/core/widgets/container/app_container.dart';
import 'package:lazy_english/local/preferences.dart';
import 'package:lazy_english/modules/first_test/models/english_level_model.dart';
import 'package:lazy_english/my_app.dart';
import 'package:lazy_english/router/app_path.dart';

class FirstTestResultScren extends StatefulWidget {
  final int point;
  const FirstTestResultScren({super.key, required this.point});

  @override
  State<FirstTestResultScren> createState() => _FirstTestResultScrenState();
}

class _FirstTestResultScrenState extends State<FirstTestResultScren> {
  late EnglishLevelModel currentUserLevel;
  List<EnglishLevelModel> englishLevelsData = [];

  @override
  void initState() {
    englishLevelsData = List.from(englishLevels);
    int index = englishLevelsData.indexWhere((element) =>
        element.minPoints! <= widget.point &&
        element.maxPoints! >= widget.point);
    currentUserLevel = englishLevelsData[index];
    englishLevelsData.removeAt(index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chúc mừng,\nBạn đang thuộc về mức',
              style: textTheme.headlineSmall,
            ),
            spaceH32,
            AppContainer(
              isSelected: true,
              isCheckContainer: true,
              child: ListTile(
                title: Text(
                  currentUserLevel.title ?? '',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  currentUserLevel.description ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.c_FF64748B,
                  ),
                ),
              ),
            ),
            spaceH24,
            Text(
              'Những cấp độ tiếng Anh còn lại',
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            // spaceH16,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = englishLevelsData[index];
                  return AppContainer(
                    isCheckContainer: true,
                    child: ListTile(
                      title: Text(
                        item.title ?? '',
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item.description ?? '',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColor.c_FF64748B,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => spaceH8,
                itemCount: englishLevelsData.length,
              ),
            ),
            spaceH8,
            AppButton(
              title: 'Tiếp tục',
              onTap: () async {
                Preferences.setAuth();
                Preferences.setEnglishLevel(currentUserLevel.title ?? '');
                GoRouter.of(context).push(AppPath.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
