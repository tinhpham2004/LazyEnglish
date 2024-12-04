import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';

class AppOutlineButton extends StatelessWidget {
  final String? title;
  final Widget? leadingIcon;
  final bool isMargin;
  final Function()? onTap;
  final Color? titleColor;
  final Color? borderColor;
  const AppOutlineButton({
    super.key,
    this.title,
    this.leadingIcon,
    this.isMargin = true,
    this.onTap,
    this.titleColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
            isMargin ? EdgeInsets.symmetric(horizontal: 16.w) : EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColor.c_FFE2E8F0),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                  spaceW8,
                ],
                Text(
                  title ?? '',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: titleColor,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
