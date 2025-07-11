// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/icons/icons_library.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';

class CardDiscount extends StatelessWidget {
  final String imagePath;
  final String title;
  final String distance;
  final String rating;

  const CardDiscount({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.r),
            child: Container(
              height: 96.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypographyStyles.bodySmallMedium(
                  title,
                  color: Neutral.neutral90,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TypographyStyles.bodyCaptionRegular(
                      distance,
                      color: Neutral.neutral60,
                      fontWeight: FontWeight.w400,
                    ), 
                    SizedBox(width: 6.w),
                    CircleAvatar(
                      radius: 2.4.r,
                    ),
                    SizedBox(width: 6.w),
                    CustomIcons.star(),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: TypographyStyles.bodyCaptionRegular(
                        '${rating} reviews',
                        color: Neutral.neutral60,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
