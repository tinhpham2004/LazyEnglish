import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final bool isMargin;
  final bool isEnable;
  final Function()? onTap;
  const AppButton({
    super.key,
    this.title,
    this.isMargin = true,
    this.isEnable = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? onTap : null,
      child: Container(
        margin:
            isMargin ? EdgeInsets.symmetric(horizontal: 16.w) : EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: isEnable ? AppColor.c_FF2970FF : AppColor.c_FFEDF2F7,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isEnable ? AppColor.white : AppColor.c_FF94A3B8,
                    ),
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
