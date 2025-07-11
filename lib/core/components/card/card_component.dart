// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/neutral_color.dart';

class CardComponent extends StatelessWidget {
  final Widget widget;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxShadow? shadow;
  final Padding? padding;
  final Border? border;

  const CardComponent({
    Key? key,
    required this.widget,
    this.backgroundColor,
    this.borderRadius,
    this.shadow,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding?.padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : BorderRadius.circular(12.r),
        border: border ?? Border.all(color: Neutral.neutral20, width: 1),
        boxShadow: shadow != null
            ? [shadow!]
            : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: widget,
    );
  }
}
