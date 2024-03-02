import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/theme/colors.dart';
import 'package:market/core/theme/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
  });

  final String textButton;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? ColorsManager.lightBlue,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: verticalPadding ?? 14.h,
            horizontal: horizontalPadding ?? 12.w,
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16))),
        fixedSize: MaterialStateProperty.all(
          Size(
            buttonWidth ?? double.maxFinite,
            buttonHeight ?? 50.h,
          ),
        ),
      ),
      child: Text(
        textButton,
        style: textStyle ?? TextStyles.font18WhiteMedium,
      ),
    );
  }
}
