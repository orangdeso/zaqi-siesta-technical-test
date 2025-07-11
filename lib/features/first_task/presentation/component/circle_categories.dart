import 'package:flutter/material.dart';

import '../../../../core/components/colors/neutral_color.dart';
import '../../../../core/components/typography/typography.dart';

class CircleCategories extends StatelessWidget {
  final String label;
  final String imagePath;

  const CircleCategories({Key? key, required this.label, required this.imagePath});


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CircleAvatar(radius: 40, backgroundImage: AssetImage(imagePath)),
        TypographyStyles.bodySmallMedium(label, color: Neutral.neutral90, fontWeight: FontWeight.w600),
      ],
    );
  }
}
