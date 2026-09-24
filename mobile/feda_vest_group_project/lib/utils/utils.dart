
import 'dart:math' as math;

import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/routes/app_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static const double _designWidth = 390;
  static const double _designHeight = 844;

  static Size get screenSize {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    return view.physicalSize / view.devicePixelRatio;
  }

  static double get screenWidth => screenSize.width;
  static double get screenHeight => screenSize.height;
  static double get screenShortestSide => math.min(screenWidth, screenHeight);

  static double get _widthFactor =>
      (screenWidth / _designWidth).clamp(0.85, 1.5).toDouble();

  static double get _heightFactor =>
      (screenHeight / _designHeight).clamp(0.85, 1.5).toDouble();

  static double get _fontFactor =>
      (screenShortestSide / _designWidth).clamp(0.9, 1.35).toDouble();

  static CustomDeviceType getDeviceType() => screenShortestSide < 500
      ? CustomDeviceType.phone
      : CustomDeviceType.tablet;

  /// Scales a horizontal/dimension value relative to the device width.
  static double w(double size) => size * _widthFactor;

  /// Scales a vertical value relative to the device height.
  static double h(double size) => size * _heightFactor;

  /// Scales a radius/round dimension relative to the device width.
  static double r(double size) => size * _widthFactor;

  /// Scales a font size relative to the device size.
  static double sp(double size) => size * _fontFactor;

  static double textSize(double size) => sp(size);

 
  static void showTopSnackBar({required String message}) {
    final context = AppRoute.navigatorKey.currentContext!;
    final snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline,
              size: 20, color: AppColors.primaryColor),
          SizedBox(width: 10),
          Expanded(
            child: AppText(
              maxline: 2,
              text: message,
              textSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        left: MediaQuery.sizeOf(context).width * 0.4,
        right: MediaQuery.sizeOf(context).width * 0.03,
        bottom: MediaQuery.sizeOf(context).width * 0.03,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}


enum CustomDeviceType { phone, tablet }

enum Error403 {
  // ignore: constant_identifier_names
  account_deactivated,
  // ignore: constant_identifier_names
  invalid_device_token,
  // ignore: constant_identifier_names
  no_password,
  // ignore: constant_identifier_names
  can_login,
}
