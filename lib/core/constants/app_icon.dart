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
}
