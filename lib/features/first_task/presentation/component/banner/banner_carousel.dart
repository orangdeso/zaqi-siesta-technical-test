// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/presentation/component/banner/banner_item.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/data/models/banner_model.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerModel> banners;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;

  const BannerCarousel({
    super.key,
    required this.banners,
    this.height,
    this.margin,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.symmetric(vertical: 16.h),
      child: _buildCarousel(),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      itemCount: widget.banners.length,
      itemBuilder: (context, index, realIndex) {
        final banner = widget.banners[index];
        return BannerItem(
          banner: banner,
          currentIndex: _currentIndex,
          totalBanners: widget.banners.length,
          onIndicatorTap: _onIndicatorTap,
        );
      },
      options: CarouselOptions(
        height: widget.height ?? 160.h,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        autoPlay: widget.autoPlay,
        autoPlayInterval: widget.autoPlayInterval,
        autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onIndicatorTap(int index) {
    _carouselController.animateToPage(index);
  }
}