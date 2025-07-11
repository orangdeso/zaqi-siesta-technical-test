import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';

class LoadMoreIndicator extends StatelessWidget {
  const LoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Neutral.neutral60),
            ),
          ),
          SizedBox(width: 12.w),
          TypographyStyles.bodyCaptionMedium(
            'Loading more products...',
            color: Neutral.neutral60,
          ),
        ],
      ),
    );
  }
}