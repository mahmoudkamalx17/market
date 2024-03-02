import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/theme/colors.dart';
import 'package:market/core/theme/font_wieght_helper.dart';

class TextStyles {
  static TextStyle font18WhiteMedium = TextStyle(
    color: ColorsManager.white,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeightHelper.medium,
    height: 0.08,
  );

  static TextStyle font20DarkBlueSemiBold = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeightHelper.semiBold,
    height: 0,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    color: ColorsManager.darkBlue,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    height: 0,
  );
}
