import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'icons_default.dart';

class CustomIcons {
  static const String _iconPath = 'assets/icons/';

  static SvgPicture getIcon(
    String fileName, {
    double? size,
    Color? color,
  }) {
    return SvgPicture.asset(
      '$_iconPath$fileName.svg',
      width: size ?? IconDefaults.defaultWidth,
      height: size ?? IconDefaults.defaultHeight,
      colorFilter: color != null 
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      fit: BoxFit.contain,
    );
  }

  // Available icons based on assets/icons folder
  static SvgPicture bookmark({double? size, Color? color}) =>
      getIcon('ic_bookmark', size: size, color: color);

  static SvgPicture equalizer({double? size, Color? color}) =>
      getIcon('ic_equalizer', size: size, color: color);

  static SvgPicture home({double? size, Color? color}) =>
      getIcon('ic_home', size: size, color: color);

  static SvgPicture mapPin({double? size, Color? color}) =>
      getIcon('ic_map_pin', size: size, color: color);

  static SvgPicture notification({double? size, Color? color}) =>
      getIcon('ic_notification', size: size, color: color);

  static SvgPicture orders({double? size, Color? color}) =>
      getIcon('ic_orders', size: size, color: color);

  static SvgPicture profile({double? size, Color? color}) =>
      getIcon('ic_profile', size: size, color: color);

  static SvgPicture search({double? size, Color? color}) =>
      getIcon('ic_search', size: size, color: color);

  static SvgPicture star({double? size, Color? color}) =>
      getIcon('ic_star', size: size, color: color);
}
