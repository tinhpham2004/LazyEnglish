import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/english_levels.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:lazy_english/core/widgets/container/app_container.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/local/preferences.dart';
import 'package:lazy_english/modules/first_test/models/english_level_model.dart';
import 'package:lazy_english/router/app_path.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late EnglishLevelModel currentLevel;

  @override
  void initState() {
    currentLevel = englishLevels.first;
    _onGetUserEnglishLevel();
    super.initState();
  }

  void _onGetUserEnglishLevel() async {
    final englishLevel = await Preferences.getEnglishLevel();
    setState(() {
      currentLevel = englishLevels.firstWhere((e) => e.title == englishLevel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: BottomNavigation(
        initialIndex: 3,
      ),
      body: Column(
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
              Container(
                height: 151.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.white.withOpacity(0.0),
                      AppColor.white.withOpacity(0.5),
                      AppColor.white.withOpacity(1.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                spaceH16,
                AppContainer(
                  isSelected: true,
                  isCheckContainer: true,
                  child: ListTile(
                    title: Text(
                      currentLevel.title ?? '',
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      currentLevel.description ?? '',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColor.c_FF64748B,
                      ),
                    ),
                  ),
                ),
                spaceH16,
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.c_FFE2E8F0),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppIcon.email,
                          spaceW8,
                          Text(
                            'Email',
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      AppIcon.arrowRightIos,
                    ],
                  ),
                ),
                spaceH8,
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppPath.setUpNotification);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.c_FFE2E8F0),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppIcon.bell,
                            spaceW8,
                            Text(
                              'Thiết lập thông báo',
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        AppIcon.arrowRightIos,
                      ],
                    ),
                  ),
                ),
                spaceH8,
                Divider(),
                spaceH8,
                InkWell(
                  onTap: () async {
                    await Preferences.removeAuth();
                    GoRouter.of(context).go(AppPath.onboarding);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.c_FFE2E8F0),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AppIcon.signOut,
                            spaceW8,
                            Text(
                              'Đăng xuất',
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        AppIcon.arrowRightIos,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
