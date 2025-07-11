// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/gray_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/green_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/neutral_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/typography/typography.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/data/models/banner_model.dart';

class BannerItem extends StatelessWidget {
  final BannerModel banner;
  final int currentIndex;
  final int totalBanners;
  final Function(int) onIndicatorTap;

  const BannerItem({
    super.key,
    required this.banner,
    required this.currentIndex,
    required this.totalBanners,
    required this.onIndicatorTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(banner.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          _buildContent(),
          _buildIndicators(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.transparent,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypographyStyles.bodyMainMedium(
                    banner.title,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    maxLines: 3,
                    height: 1.2.h,
                  ),
                ],
              ),
            ),
            _buildOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Neutral.neutral100,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: TypographyStyles.bodySmallMedium(
        banner.buttonText,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      bottom: 16.h,
      right: 16.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(totalBanners, (index) {
            return GestureDetector(
              onTap: () => onIndicatorTap(index),
              child: Container(
                width: 14.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: currentIndex == index
                      ? Green.fromDesign
                      : Gray.gray200,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}