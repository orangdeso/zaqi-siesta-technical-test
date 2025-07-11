import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/components/colors/neutral_color.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 6,
      itemBuilder: (context, index) => _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Container(
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
          _buildShimmerImage(),
          _buildShimmerContent(),
        ],
      ),
    );
  }

  Widget _buildShimmerImage() {
    return Shimmer.fromColors(
      baseColor: Neutral.neutral20,
      highlightColor: Neutral.neutral10,
      child: Container(
        height: 180.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Neutral.neutral20,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        ),
      ),
    );
  }

  Widget _buildShimmerContent() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),         
          SizedBox(height: 8.h),
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: double.infinity,
              height: 20.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: 200.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),        
          SizedBox(height: 8.h),
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: double.infinity,
              height: 16.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: 150.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Shimmer.fromColors(
            baseColor: Neutral.neutral20,
            highlightColor: Neutral.neutral10,
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Neutral.neutral20,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}