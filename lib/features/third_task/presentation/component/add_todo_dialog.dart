import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaqi_siesta_technical_test/core/components/text_field/text_field_component.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/colors/brand_color.dart';
import '../../../../core/components/typography/typography.dart';
import '../../domain/entities/todo_entity.dart';

class AddTodoDialog extends StatefulWidget {
  final TodoEntity? todo;
  final Function(String title, String? description) onSave;

  const AddTodoDialog({
    super.key,
    this.todo,
    required this.onSave,
  });

  bool get isEdit => todo != null;

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo?.title ?? '');
    _descriptionController = TextEditingController(text: widget.todo?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TypographyStyles.bodyLargeMedium(
                      widget.isEdit ? 'Edit Todo' : 'Add New Todo',
                      color: Neutral.neutral100,
                      fontWeight: FontWeight.w600,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: Neutral.neutral60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TypographyStyles.bodySmallMedium(
                  'Title *',
                  color: Neutral.neutral90,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                TextFieldComponent(
                  controller: _titleController, 
                  hintText: 'Enter todo title', 
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                TypographyStyles.bodySmallMedium(
                  'Description',
                  color: Neutral.neutral90,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                TextFieldComponent(controller: _descriptionController, hintText: 'Enter todo description (optional)', maxLines: 3),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Neutral.neutral40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: TypographyStyles.bodySmallMedium(
                          'Cancel',
                          color: Neutral.neutral70,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _handleSave,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Brand.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: TypographyStyles.bodySmallMedium(
                          widget.isEdit ? 'Update' : 'Add Todo',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      print('🔍 [AddTodoDialog] Saving todo - Title: ${_titleController.text.trim()}, Description: ${_descriptionController.text.trim()}');
      widget.onSave(
        _titleController.text.trim(),
        _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      );
      Navigator.of(context).pop();
    }
  }
}