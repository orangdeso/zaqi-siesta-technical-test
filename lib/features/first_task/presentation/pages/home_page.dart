// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/green_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/neutral_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/icons/icons_library.dart';
import 'package:zaqi_siesta_technical_test/core/components/search_bar/search_bar_component.dart';
import 'package:zaqi_siesta_technical_test/core/components/typography/typography.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/presentation/component/banner/banner_carousel.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/data/models/banner_model.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/presentation/component/bottom_navbar.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/presentation/component/card_discount.dart';
import 'package:zaqi_siesta_technical_test/features/first_task/presentation/component/circle_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBottomNavIndex = 0;

  void _handleBottomNavTap(int index) {
    if (_shouldNavigate(index)) {
      setState(() {
        _currentBottomNavIndex = index;
      });
    }
    _handleNavTap(index);
  }

  bool _shouldNavigate(int index) {
    return index == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopHeader(),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: SearchBarComponent(),
                ),
                BannerCarousel(
                  banners: BannerModel.getDummyBanners(),
                  height: 160.h,
                  margin: EdgeInsets.only(top: 20.h),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: _buildTopCategories(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: _buildTopDiscount(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) => _handleBottomNavTap(index),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: Green.fromDesign.withOpacity(0.10),
          ),
          child: CustomIcons.mapPin(size: 24),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Row(
                children: [
                  TypographyStyles.captionSmall(
                    'Current location',
                    color: Neutral.neutral70,
                    fontWeight: FontWeight.w400,
                  ),
                  Icon(Icons.arrow_drop_down, size: 16, color: Neutral.neutral70),
                ],
              ),
              TypographyStyles.bodyCaptionMedium(
                'Jl. Soekarno Hatta 15A Malang',
                color: Neutral.neutral100,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(color: Neutral.neutral20, borderRadius: BorderRadius.circular(3.r)),
          child: CustomIcons.notification(size: 24),
        ),
      ],
    );
  }

  Widget _buildTopCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextHeader(title: 'Top Categories'),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleCategories(label: 'Beverages', imagePath: 'assets/images/beverages.png'),
            CircleCategories(label: 'Snack', imagePath: 'assets/images/snack.png'),
            CircleCategories(label: 'Seafood', imagePath: 'assets/images/seafood.png'),
            CircleCategories(label: 'Dessert', imagePath: 'assets/images/dessert.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildTopDiscount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextHeader(title: 'Top Discount'),
        SizedBox(height: 14.h),
        Row(
          children: [
            Expanded(
              child: CardDiscount(
                imagePath: 'assets/images/starbuck.png',
                title: 'Starbuck Borobudur',
                distance: '1.0 km',
                rating: '4.8',
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CardDiscount(
                imagePath: 'assets/images/baegopa.png',
                title: 'Baegopa Suhat',
                distance: '500 m',
                rating: '4.8',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextHeader({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TypographyStyles.bodyLargeMedium(title, color: Neutral.neutral90, fontWeight: FontWeight.w600),
        TypographyStyles.bodySmallMedium('See all', color: Neutral.neutral50, fontWeight: FontWeight.w600),
      ],
    );
  }

  void _handleNavTap(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Get.snackbar(
          'Coming Soon',
          'Orders feature will be available soon',
          backgroundColor: Colors.grey[800],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
        break;
      case 2:
        Get.snackbar(
          'Coming Soon',
          'Bookmark feature will be available soon',
          backgroundColor: Colors.grey[800],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
        break;
      case 3:
        Get.snackbar(
          'Coming Soon',
          'Profile feature will be available soon',
          backgroundColor: Colors.grey[800],
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
        break;
    }
  }
}
