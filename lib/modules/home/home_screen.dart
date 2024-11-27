import 'package:flutter/material.dart';
import 'package:lazy_english/core/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
