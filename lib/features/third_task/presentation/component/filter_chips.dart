// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/colors/brand_color.dart';
import '../../../../core/components/typography/typography.dart';

enum TodoFilter { all, pending, completed }

class FilterChips extends StatelessWidget {
  final TodoFilter selectedFilter;
  final Function(TodoFilter) onFilterChanged;
  final int allCount;
  final int pendingCount;
  final int completedCount;

  const FilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.allCount,
    required this.pendingCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFilterChip(
            label: 'All',
            count: allCount,
            filter: TodoFilter.all,
            isSelected: selectedFilter == TodoFilter.all,
          ),
          SizedBox(width: 10.w),
          _buildFilterChip(
            label: 'Pending',
            count: pendingCount,
            filter: TodoFilter.pending,
            isSelected: selectedFilter == TodoFilter.pending,
          ),
          SizedBox(width: 10.w),
          _buildFilterChip(
            label: 'Completed',
            count: completedCount,
            filter: TodoFilter.completed,
            isSelected: selectedFilter == TodoFilter.completed,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required int count,
    required TodoFilter filter,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onFilterChanged(filter),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Brand.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? Brand.primary : Neutral.neutral20,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TypographyStyles.bodyCaptionMedium(
              label,
              color: isSelected ? Colors.white : Neutral.neutral70,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 4.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withOpacity(0.2) : Neutral.neutral20,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TypographyStyles.captionSmall(
                count.toString(),
                color: isSelected ? Colors.white : Neutral.neutral60,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}