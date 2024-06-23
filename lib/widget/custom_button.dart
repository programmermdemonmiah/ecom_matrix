import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:flutter/material.dart';

Widget customButton({
  required String buttonName,
  required BuildContext context,
  final Color? fontColor,
  final Color? borderColor,
  final Color? bgColor,
  final double? radius,
  final Gradient? borderGradient,
  final bool isBorderGradient = false,
  final VoidCallback? onTap,
  final FocusNode? focusNode,
}) {
  return Container(
    // height: 40.sp,
    width: double.infinity,
    // padding: edgeInsetsAll(2.2),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: radiusAll(radius ?? 2.5),
        border: Border.all(
          width: 2,
          color: borderColor ?? primaryColor,
        ),
        color: bgColor ?? primaryColor),
    child: InkWell(
      onTap: onTap,
      focusNode: focusNode,
      splashColor: Colors.black12,
      child: Container(
        width: double.infinity,
        padding: edgeInsetsAll(2.2),
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: AppTextStyle.tittleBig3(
            context: context,
            color: fontColor ?? Colors.white,
          ),
        ),
      ),
    ),
  );
}
