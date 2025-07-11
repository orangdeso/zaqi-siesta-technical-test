import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;

  const ProductImageCarousel({
    super.key,
    required this.images,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return _buildEmptyImagePlaceholder();
    }

    if (widget.images.length == 1) {
      return _buildSingleImage();
    }

    return _buildImageCarousel();
  }

  Widget _buildEmptyImagePlaceholder() {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Neutral.neutral20,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          size: 48.sp,
          color: Neutral.neutral60,
        ),
      ),
    );
  }

  Widget _buildSingleImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 200.h,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: widget.images.first,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildImagePlaceholder(),
          errorWidget: (context, url, error) => _buildImageError(),
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => _buildImagePlaceholder(),
                  errorWidget: (context, url, error) => _buildImageError(),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200.h,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 12.h),
        _buildImageIndicators(),
        SizedBox(height: 8.h),
        _buildImageCounter(),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: Neutral.neutral20,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Neutral.neutral60),
        ),
      ),
    );
  }

  Widget _buildImageError() {
    return Container(
      color: Neutral.neutral20,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported_outlined,
              size: 48.sp,
              color: Neutral.neutral60,
            ),
            SizedBox(height: 8.h),
            Text(
              'Failed to load image',
              style: TextStyle(
                color: Neutral.neutral60,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.images.length,
        (index) => GestureDetector(
          onTap: () => _carouselController.animateToPage(index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index 
                  ? Neutral.neutral90 
                  : Neutral.neutral40,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCounter() {
    return TypographyStyles.bodyCaptionRegular(
      '${_currentIndex + 1} of ${widget.images.length}',
      color: Neutral.neutral60,
      textAlign: TextAlign.center,
    );
  }
}