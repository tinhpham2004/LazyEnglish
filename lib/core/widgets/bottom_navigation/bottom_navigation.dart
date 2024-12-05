import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/gen/assets.gen.dart';
import 'package:lazy_english/router/app_path.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;
  const BottomNavigation({super.key, required this.initialIndex});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColor.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: widget.initialIndex == 0
              ? Assets.icons.selectedSystem.svg()
              : Assets.icons.system.svg(),
          label: 'Hệ thống',
        ),
        BottomNavigationBarItem(
          icon: widget.initialIndex == 1
              ? Assets.icons.selectedNoti.svg()
              : Assets.icons.noti.svg(),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: widget.initialIndex == 2
              ? Assets.icons.selectedMyCard.svg()
              : Assets.icons.myCard.svg(),
          label: 'Card của tôi',
        ),
        BottomNavigationBarItem(
          icon: widget.initialIndex == 3
              ? Assets.icons.selectedUser.svg()
              : Assets.icons.account.svg(),
          label: 'Tài khoản',
        ),
      ],
      currentIndex: widget.initialIndex,
      selectedItemColor: AppColor.c_FF2970FF,
      selectedLabelStyle: textTheme.bodySmall,
      showUnselectedLabels: true,
      unselectedLabelStyle: textTheme.bodySmall,
      unselectedItemColor: AppColor.c_FF94A3B8,
      elevation: 0,
      onTap: (value) {
        switch (value) {
          case 0:
            GoRouter.of(context).go(AppPath.home);
            break;
          case 1:
            GoRouter.of(context).go(AppPath.notification);
            break;
          case 2:
            GoRouter.of(context).go(AppPath.myCard);
            break;
          case 3:
            GoRouter.of(context).go(AppPath.account);
            break;
          default:
            break;
        }
      },
    );
  }
}
