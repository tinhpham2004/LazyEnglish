import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/router/app_path.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigation(
        initialIndex: 1,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            spaceH32,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppPath.cardSet);
                    },
                    child: Row(
                      children: [
                        Assets.images.cardThumbnail.image(
                          height: 75.h,
                          width: 75.w,
                        ),
                        spaceW16,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông báo mới ${index + 1}',
                              style: textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${index + 1} phút trước',
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColor.c_FF64748B,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => spaceH16,
                itemCount: 10,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
