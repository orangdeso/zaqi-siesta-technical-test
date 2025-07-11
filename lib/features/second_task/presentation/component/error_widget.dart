import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';
import '../../../../core/components/button/button_fill_component.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    IconData errorIcon = Icons.error_outline;
    String errorTitle = 'Oops! Something went wrong';
    
    if (message.toLowerCase().contains('internet') || 
        message.toLowerCase().contains('connection') ||
        message.toLowerCase().contains('network')) {
      errorIcon = Icons.wifi_off;
      errorTitle = 'No Internet Connection';
    } else if (message.toLowerCase().contains('timeout')) {
      errorIcon = Icons.access_time;
      errorTitle = 'Connection Timeout';
    } else if (message.toLowerCase().contains('server')) {
      errorIcon = Icons.dns;
      errorTitle = 'Server Error';
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              errorIcon,
              size: 64.sp,
              color: Neutral.neutral60,
            ),
            SizedBox(height: 16.h),
            TypographyStyles.bodySmallMedium(
              errorTitle,
              color: Neutral.neutral90,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            TypographyStyles.bodyCaptionRegular(
              message,
              color: Neutral.neutral60,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),   
            SizedBox(height: 24.h),
            if (onRetry != null)
              SizedBox(
                width: 200.w,
                child: ButtonFillComponent(
                  text: 'Try Again',
                  textColor: Colors.white,
                  onTap: onRetry,
                ),
              ),
          ],
        ),
      ),
    );
  }
}