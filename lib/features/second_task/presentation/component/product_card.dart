// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/colors/red_color.dart';
import '../../../../core/components/typography/typography.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildProductInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      child: Container(
        height: 180.h,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: product.images.isNotEmpty ? product.images.first : '',
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Neutral.neutral20,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Neutral.neutral60),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Neutral.neutral20,
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 48.sp,
                color: Neutral.neutral60,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Red.red100,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: TypographyStyles.bodyCaptionMedium(
              product.category.name,
              color: Red.red500,
            ),
          ),
          SizedBox(height: 8.h),
          TypographyStyles.bodySmallMedium(
            product.title,
            color: Neutral.neutral100,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),  
          SizedBox(height: 4.h),
          TypographyStyles.captionSmall(
            product.description,
            color: Neutral.neutral60,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h),
          TypographyStyles.bodyCaptionRegular(
            '\$${product.price.toStringAsFixed(2)}',
            color: Neutral.neutral100,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}