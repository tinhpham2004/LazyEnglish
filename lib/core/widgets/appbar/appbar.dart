import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  Appbar({super.key, this.actions, this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      title: title,
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: AppIcon.arrowLeft,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
