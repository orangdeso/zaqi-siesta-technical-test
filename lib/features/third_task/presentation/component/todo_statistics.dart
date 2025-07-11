// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/card/card_component.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/colors/green_color.dart';
import '../../../../core/components/colors/brand_color.dart';
import '../../../../core/components/typography/typography.dart';

class TodoStatistics extends StatelessWidget {
  final int totalTodos;
  final int completedTodos;
  final int pendingTodos;

  const TodoStatistics({super.key, required this.totalTodos, required this.completedTodos, required this.pendingTodos});

  @override
  Widget build(BuildContext context) {
    final completionRate = totalTodos > 0 ? (completedTodos / totalTodos) : 0.0;

    return CardComponent(
      backgroundColor: Green.green100,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TypographyStyles.bodyMainMedium('Your Progress', color: Neutral.neutral90, fontWeight: FontWeight.w600),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Green.fromDesign.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TypographyStyles.captionSmall(
                  '${(completionRate * 100).toInt()}%',
                  color: Green.fromDesign,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            height: 8.h,
            decoration: BoxDecoration(color: Neutral.neutral20, borderRadius: BorderRadius.circular(4.r)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: completionRate,
              child: Container(
                decoration: BoxDecoration(color: Green.fromDesign, borderRadius: BorderRadius.circular(4.r)),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildStatItem(label: 'Total', value: totalTodos.toString(), color: Brand.primary),
              SizedBox(width: 24.w),
              _buildStatItem(label: 'Pending', value: pendingTodos.toString(), color: Neutral.neutral60),
              SizedBox(width: 24.w),
              _buildStatItem(label: 'Completed', value: completedTodos.toString(), color: Green.fromDesign),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({required String label, required String value, required Color color}) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyStyles.bodyLargeMedium(value, color: color, fontWeight: FontWeight.w700),
        TypographyStyles.captionSmall(label, color: Neutral.neutral60, fontWeight: FontWeight.w400),
      ],
    );
  }
}
