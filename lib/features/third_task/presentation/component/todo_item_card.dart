// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zaqi_siesta_technical_test/core/components/card/card_component.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/gray_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/green_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/neutral_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/typography/typography.dart';
import '../../domain/entities/todo_entity.dart';

class TodoItemCard extends StatelessWidget {
  final TodoEntity todo;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoItemCard({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
        widget: Row(
          children: [
            _buildCheckBox(),
            SizedBox(width: 12.w),
            _buildItemContent(),
            PopupMenuButton<String>(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    onEdit();
                    break;
                  case 'delete':
                    onDelete();
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 16.sp, color: Gray.gray500),
                      SizedBox(width: 8.w),
                      TypographyStyles.bodyCaptionMedium('Edit', color: Gray.gray800, fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 16.sp, color: Gray.gray500),
                      SizedBox(width: 8.w),
                      TypographyStyles.bodyCaptionMedium('Delete', color: Gray.gray800, fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
              ],
              child: Icon(Icons.more_vert, color: Gray.gray400, size: 20.sp),
            ),
          ],
        ),
      );
  }

  Widget _buildCheckBox() {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: todo.isCompleted ? Green.green500 : Neutral.neutral40, width: 2),
          color: todo.isCompleted ? Green.green500 : Colors.transparent,
        ),
        child: todo.isCompleted ? Icon(Icons.check, size: 16.sp, color: Colors.white) : null,
      ),
    );
  }

  Widget _buildItemContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildDate(iconData: Icons.calendar_today_rounded, value: _formatDateOnly(todo.createdAt)),
              SizedBox(width: 8.w),
              _buildDate(iconData: Icons.access_time_rounded, value: _formatTimeOnly(todo.createdAt))
            ],
          ),
          SizedBox(height: 10.h),
          TypographyStyles.bodySmallMedium(
            todo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
            color: Gray.gray800,
          ),
          if (todo.description != null && todo.description!.isNotEmpty) ...[
            SizedBox(height: 6.h),
            TypographyStyles.bodyCaptionRegular(
              todo.description!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              color: Gray.gray500,
              height: 1.3,
            ),
          ],
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget _buildDate({required IconData iconData, required String value}) {
    return Row(
      children: [
        Icon(iconData, size: 16, color: Gray.gray500),
        SizedBox(width: 4.w),
        TypographyStyles.captionSmall(value, color: Gray.gray500),
      ],
    );
  }

  String _formatDateOnly(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat('EEEE').format(date);
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  String _formatTimeOnly(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }
}
