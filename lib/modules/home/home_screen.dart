import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/router/app_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onCardThumbnailToggle() {
    GoRouter.of(context).push(AppPath.cardSet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigation(
        initialIndex: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 150.h,
                width: 1.sw,
                child: Assets.images.topArea.image(fit: BoxFit.fill),
              ),
              Row(
                children: [
                  spaceW16,
                  Text(
                    'Chào Tính,',
                    style: textTheme.titleMedium!.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spaceH32,
                        Text(
                          'Bộ card phù hợp với bạn',
                          style: textTheme.titleMedium!.copyWith(),
                        ),
                        spaceH16,
                        SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                width: 150.w,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: _onCardThumbnailToggle,
                                      child:
                                          Assets.images.cardThumbnail.image(),
                                    ),
                                    spaceH16,
                                    Text(
                                      'Bộ card ${index + 1} có thể phù hợp với bạn',
                                      style: textTheme.bodyMedium!.copyWith(
                                        color: AppColor.c_FF64748B,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => spaceW8,
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spaceH32,
                        Text(
                          'Có thể bạn sẽ thích lộ trình này',
                          style: textTheme.titleMedium!.copyWith(),
                        ),
                        spaceH16,
                        Container(
                          height: 150.h,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(AppPath.cardSet);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Container(
                                    width: 300.w,
                                    child: Assets
                                        .images.recommendJourneyThumbnail
                                        .image(fit: BoxFit.fill),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => spaceW8,
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
