// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/gen/assets.gen.dart';

final size = 16.sp;

class AppIcon {
  AppIcon._();

  static Icon arrowLeft = Icon(
    Icons.arrow_back,
    size: size + 5.sp,
  );

  static Widget google = Assets.icons.googleIcon.svg();

  static Icon check = Icon(
    Icons.check,
    color: AppColor.white,
    size: size + 5.sp,
  );
  static Icon bookmark = Icon(
    Icons.bookmark_outline_rounded,
    size: size + 8.sp,
  );
  static Icon bookmarkSelected = Icon(
    Icons.bookmark_rounded,
    color: AppColor.c_FFFCD34D,
    size: size + 8.sp,
  );
  static Icon arrowRight = Icon(
    Icons.arrow_right_rounded,
    size: size + 12.sp,
  );
  static Widget lock = Assets.icons.lock.svg();
  static Widget arrowUpLeft = Assets.icons.arrowUpLeft.svg();
}
