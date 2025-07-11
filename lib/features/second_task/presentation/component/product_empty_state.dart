import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';

class ProductEmptyState extends StatelessWidget {
  const ProductEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64.sp,
              color: Neutral.neutral60,
            ),
            SizedBox(height: 16.h),
            TypographyStyles.bodySmallMedium(
              'No Products Found',
              color: Neutral.neutral90,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            TypographyStyles.bodyCaptionRegular(
              'Try adjusting your search or check back later',
              color: Neutral.neutral60,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}