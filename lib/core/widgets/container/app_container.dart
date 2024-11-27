import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final bool isSelected;
  final bool isCheckContainer;
  AppContainer({
    super.key,
    this.child,
    this.isSelected = false,
    this.isCheckContainer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: isCheckContainer ? EdgeInsets.all(8.w) : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? AppColor.c_FF2970FF : AppColor.c_FFE2E8F0,
              width: 1,
            ),
          ),
          child: child,
        ),
        if (isSelected && isCheckContainer)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: const BoxDecoration(
                color: AppColor.c_FF2970FF,
                shape: BoxShape.circle,
              ),
              child: AppIcon.check,
            ),
          ),
      ],
    );
  }
}
