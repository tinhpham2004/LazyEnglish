import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';

void showErrorSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    content: Text(
      errorMessage,
      style: const TextStyle(color: AppColor.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: AppColor.error,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    action: SnackBarAction(
      label: 'Ẩn',
      textColor: AppColor.white,
      onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackbar(BuildContext context, String successMessage) {
  final snackBar = SnackBar(
    content: Text(
      successMessage,
      style: const TextStyle(color: AppColor.white),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: AppColor.success,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    action: SnackBarAction(
      label: 'Ẩn',
      textColor: AppColor.white,
      onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
