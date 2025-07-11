import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/green_color.dart';
import 'package:zaqi_siesta_technical_test/routes/routes.dart';

import '../../../../core/components/button/button_fill_component.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              ButtonFillComponent(
                text: 'First Task',
                textColor: Colors.white,
                backgroundColor: Green.green500,
                onTap: () => _handleFirstTask(),
              ),
              ButtonFillComponent(
                text: 'Second Task',
                textColor: Colors.white,
                backgroundColor: Green.green500,
                onTap: () => _handleSecondTask(),
              ),
              ButtonFillComponent(
                text: 'Third Task',
                textColor: Colors.white,
                backgroundColor: Green.green500,
                onTap: () => _handleThirdTask(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFirstTask() {
    Get.toNamed(Routes.homePage);
  }

  void _handleSecondTask() {
    Get.toNamed(Routes.secondTask);
  }

  void _handleThirdTask() {
    Get.toNamed(Routes.thirdTask);
  }
}
