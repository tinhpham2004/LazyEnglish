import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/appbar/appbar.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/router/app_path.dart';

class CardSetScreen extends StatefulWidget {
  CardSetScreen({super.key});

  @override
  State<CardSetScreen> createState() => _CardSetScreenState();
}

class _CardSetScreenState extends State<CardSetScreen> {
  bool _isBookmark = false;
  int numCardSet = 10;

  void _onBookmarkToggle() {
    setState(() {
      _isBookmark = !_isBookmark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: Appbar(
        actions: [
          InkWell(
            onTap: () => _onBookmarkToggle(),
            child: _isBookmark ? AppIcon.bookmarkSelected : AppIcon.bookmark,
          ),
          spaceW16,
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Assets.images.cardThumbnail.image(),
                    spaceW16,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bộ card Pro Max',
                          style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        spaceH8,
                        Text(
                          '${numCardSet} Bộ',
                          style: textTheme.bodyMedium!.copyWith(
                            color: AppColor.c_FF64748B,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                spaceH16,
                Text(
                  'Học xong 10.0 IELTS',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.c_FF64748B,
                  ),
                ),
                spaceH16,
              ],
            ),
          ),
          const Divider(),
          spaceH16,
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppPath.cardSetDetail);
                    },
                    child: Opacity(
                      opacity: index > 2 ? 0.5 : 1,
                      child: Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColor.c_FFE2E8F0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                spaceW16,
                                Text(
                                  'Bộ ${index + 1}',
                                  style: textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                if (index > 2) ...[
                                  AppIcon.lock,
                                  spaceW8,
                                ],
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15',
                                        style: textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.c_FF2970FF,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/15',
                                        style: textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.c_FF94A3B8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AppIcon.arrowRight,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => spaceH16,
                itemCount: numCardSet,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
