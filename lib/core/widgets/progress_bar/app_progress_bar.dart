import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';

class AppProgressBar extends StatefulWidget {
  final String? title;
  final double? value;

  AppProgressBar({super.key, this.title, this.value});

  @override
  State<AppProgressBar> createState() => _AppProgressBarState();
}

class _AppProgressBarState extends State<AppProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: widget.value,
            color: AppColor.c_FF2970FF,
            backgroundColor: AppColor.c_FFEDF2F7,
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        spaceW8,
        Text(
          widget.title ?? '',
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
