// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/green_color.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/icons/icons_library.dart';
import '../../../../core/components/typography/typography.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Neutral.neutral40,
            width: 0.8.w,
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: CustomIcons.home,
                label: 'Home',
                index: 0,
                isActive: widget.currentIndex == 0,
              ),
              _buildNavItem(
                icon: CustomIcons.orders,
                label: 'Orders',
                index: 1,
                isActive: widget.currentIndex == 1,
              ),
              _buildNavItem(
                icon: CustomIcons.bookmark,
                label: 'Bookmark',
                index: 2,
                isActive: widget.currentIndex == 2,
              ),
              _buildNavItem(
                icon: CustomIcons.profile,
                label: 'Profile',
                index: 3,
                isActive: widget.currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required Widget Function({double? size, Color? color}) icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon(
              size: 24.w,
              color: isActive ? Green.fromDesign : Neutral.neutral50,
            ),
            SizedBox(height: 4.h),
            TypographyStyles.captionSmall(
              label,
              color: isActive ? Green.fromDesign : Neutral.neutral50,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}