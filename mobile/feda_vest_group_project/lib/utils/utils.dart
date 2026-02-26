
import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/routes/app_route.dart';
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
