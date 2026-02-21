
import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:flutter/material.dart';

class Utils {
  static CustomDeviceType getDeviceType() {
    final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    return data.size.shortestSide < 500
        ? CustomDeviceType.phone
        : CustomDeviceType.tablet;
  }

  static double textSize(double size) {
    if (getDeviceType() == CustomDeviceType.tablet) {
      return size - 2;
    }
    return size;
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
