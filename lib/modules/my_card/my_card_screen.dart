import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/router/app_path.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigation(
        initialIndex: 2,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            spaceH32,
            Stack(
              children: [
                Assets.images.myCardBackground.image(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card của tôi',
                      style: textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    spaceH8,
                    Text(
                      '10 bộ',
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColor.c_FF64748B,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            spaceH8,
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 32.h,
                children: List.generate(
                  10,
                  (index) => InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppPath.cardSet);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.images.cardThumbnail.image(fit: BoxFit.fill),
                        spaceH4,
                        Flexible(
                          child: Text(
                            'Bộ card ${index + 1}',
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColor.c_FF64748B,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
