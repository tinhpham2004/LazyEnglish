import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_name.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/button/app_outline_button.dart';
import 'package:lazy_english/gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  // To track the current carousel item
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _carouselContent = [
      {
        'title': 'Learn English with LazyEnglish',
        'subtitle': 'Start your journey to learn English with LazyEnglish.',
      },
      {
        'title': 'Learn English Fast',
        'subtitle': 'Practice daily to build confidence and master English.',
      },
      {
        'title': 'Unlock Your Potential',
        'subtitle': 'Achieve your goals by learning English effectively.',
      },
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 16.w),
              child: Column(
                children: [
                  // Logo and App Name
                  Row(
                    children: [
                      Assets.icons.logo.svg(),
                      spaceW8,
                      Text(
                        appName,
                        style: textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  spaceH16,
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200.h,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              enlargeCenterPage: false,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: _carouselContent.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      Text(
                                        item['title']!,
                                        style:
                                            textTheme.headlineMedium!.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // Subtitle
                                      Text(
                                        item['subtitle']!,
                                        style: textTheme.bodyLarge!.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                          // Indicators
                          Row(
                            children:
                                _carouselContent.asMap().entries.map((entry) {
                              return Container(
                                width: _currentIndex == entry.key ? 32.w : 16.w,
                                height: 4.h,
                                margin: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 4.w,
                                ),
                                decoration: BoxDecoration(
                                  color: _currentIndex == entry.key
                                      ? AppColor.white
                                      : AppColor.c_99FFFFFF,
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đăng nhập với',
                    style: textTheme.headlineSmall,
                  ),
                  spaceH32,
                  AppOutlineButton(
                    title: 'Đăng nhập bằng Google',
                    leadingIcon: AppIcon.google,
                    isMargin: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
