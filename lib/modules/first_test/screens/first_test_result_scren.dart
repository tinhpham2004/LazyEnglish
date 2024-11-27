import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/button/app_button.dart';
import 'package:lazy_english/core/widgets/container/app_container.dart';
import 'package:lazy_english/local/preferences.dart';
import 'package:lazy_english/modules/first_test/models/english_level_model.dart';
import 'package:lazy_english/my_app.dart';
import 'package:lazy_english/router/app_path.dart';

class FirstTestResultScren extends StatefulWidget {
  const FirstTestResultScren({super.key});

  @override
  State<FirstTestResultScren> createState() => _FirstTestResultScrenState();
}

class _FirstTestResultScrenState extends State<FirstTestResultScren> {
  List<EnglishLevelModel> levels = [
    EnglishLevelModel(
      title: 'A1 (Beginner)',
      description:
          'Sơ cấp: Người học có thể hiểu và sử dụng những cụm từ quen thuộc và các câu cơ bản để đáp ứng nhu cầu giao tiếp đơn giản.',
    ),
    EnglishLevelModel(
      title: 'A2 (Elementary)',
      description:
          'Sơ trung cấp: Có thể giao tiếp trong các tình huống thường gặp, như giới thiệu bản thân, hỏi đường, hoặc mua sắm.',
    ),
    EnglishLevelModel(
      title: 'B1 (Intermediate)',
      description:
          'Trung cấp: Có thể xử lý những tình huống giao tiếp phổ biến và hiểu nội dung chính của các đoạn văn bản đơn giản',
    ),
    EnglishLevelModel(
      title: 'B2 (Upper-Intermediate)',
      description:
          'Trung cấp cao: Có thể hiểu và giao tiếp trôi chảy trong môi trường học thuật hoặc công việc, xử lý các tình huống giao tiếp phức tạp hơn.',
    ),
    EnglishLevelModel(
      title: 'C1 (Advanced)',
      description:
          'Cao cấp: Hiểu và diễn đạt thành thạo các nội dung phức tạp trong giao tiếp và công việc chuyên môn.',
    ),
    EnglishLevelModel(
      title: 'C2 (Proficiency)',
      description:
          'Thành thạo: Có khả năng sử dụng ngôn ngữ như người bản xứ, hiểu và diễn đạt tốt các ý tưởng trừu tượng và phức tạp.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentUserLevel = levels[2];
    levels.removeAt(2);
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
                  final item = levels[index];
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
                itemCount: levels.length,
              ),
            ),
            spaceH8,
            AppButton(
              title: 'Tiếp tục',
              onTap: () async {
                Preferences.setAuth();
                GoRouter.of(context).push(AppPath.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
