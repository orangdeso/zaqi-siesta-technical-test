import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/brand_color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../colors/gray_color.dart';
import '../typography/typography.dart';


class ButtonFillComponent extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool isLoading;
  final Color? backgroundColor;

  const ButtonFillComponent({
    Key? key,
    required this.text,
    required this.textColor,
    this.onTap,
    this.isLoading = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isLoading ? Gray.gray400 : (backgroundColor ?? Brand.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: isLoading
                ? _rowLoading()
                : TypographyStyles.button( 
                    text,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _rowLoading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypographyStyles.h6(
          'Loading...',
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5.w,
          ),
        )
      ],
    );
  }
}
