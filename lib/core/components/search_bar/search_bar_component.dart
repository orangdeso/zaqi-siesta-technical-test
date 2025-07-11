import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/green_color.dart';
import 'package:zaqi_siesta_technical_test/core/components/colors/neutral_color.dart';

import '../typography/size/font_size.dart';

class SearchBarComponent extends StatelessWidget {
  final String hintText;

  const SearchBarComponent({
    super.key,
    this.hintText = 'Search menu, restaurant or etc',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Neutral.neutral60,
        ),
        suffixIcon: const Icon(
          Icons.tune,
          color: Neutral.neutral60,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.interTight(
          fontSize: FontSize.small,
          fontWeight: FontWeight.w400,
          color: Neutral.neutral60,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Neutral.neutral30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Neutral.neutral30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Green.green500),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}