import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_english/core/constants/app_name.dart';

class MyApp extends StatefulWidget {
  final GoRouter router;

  MyApp({Key? key, required this.router}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              // textSelectionTheme: const TextSelectionThemeData(
              //   cursorColor: AppColor.primaryColor,
              //   selectionColor: AppColor.primaryColor,
              //   selectionHandleColor: AppColor.primaryColor,
              // ),
              ),
          routerConfig: widget.router,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return widget!;
          },
        );
      },
    );
  }
}
