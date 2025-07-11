import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';
import '../../domain/entities/product_entity.dart';
import 'product_image_carousel.dart';

class ProductDetailModal extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailModal({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          _buildHandleBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageCarousel(images: product.images),
                  SizedBox(height: 16.h),
                  _buildCategoryChip(),
                  SizedBox(height: 12.h),
                  _buildTitle(),
                  SizedBox(height: 8.h),
                  _buildPrice(),
                  SizedBox(height: 16.h),
                  _buildDescriptionSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandleBar() {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Neutral.neutral40,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildCategoryChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Neutral.neutral20,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TypographyStyles.bodyCaptionMedium(
        product.category.name,
        color: Neutral.neutral90,
      ),
    );
  }

  Widget _buildTitle() {
    return TypographyStyles.bodyMainMedium(
      product.title,
      color: Neutral.neutral100,
      fontWeight: FontWeight.w600,
      maxLines: 3,
    );
  }

  Widget _buildPrice() {
    return TypographyStyles.bodyMainMedium(
      '\$${product.price.toStringAsFixed(2)}',
      color: Neutral.neutral100,
      fontWeight: FontWeight.w700,
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyStyles.bodySmallMedium(
          'Description',
          color: Neutral.neutral90,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        TypographyStyles.bodyCaptionRegular(
          product.description,
          color: Neutral.neutral70,
          maxLines: 10,
        ),
      ],
    );
  }
}