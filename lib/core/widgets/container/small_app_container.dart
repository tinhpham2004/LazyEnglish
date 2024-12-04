import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';

class SmallAppContainer extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const SmallAppContainer({
    super.key,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: backgroundColor,
        border: Border.all(
          color: borderColor ?? AppColor.transparent,
        ),
      ),
      padding: padding ?? EdgeInsets.all(4.w),
      margin: margin ?? EdgeInsets.zero,
      child: Center(
        child: Text(
          title ?? '',
          style: textTheme.labelMedium!.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
