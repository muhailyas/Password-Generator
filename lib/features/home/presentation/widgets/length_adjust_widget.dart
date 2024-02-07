import 'package:flutter/material.dart';
import 'package:password_generator/core/colors/colors.dart';

class LengthAdjustWidget extends StatelessWidget {
  const LengthAdjustWidget(
      {super.key,
      required this.screenWidth,
      required this.ontap,
      required this.iconData});

  final double screenWidth;
  final VoidCallback ontap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: screenWidth * 0.06,
        width: screenWidth * 0.06,
        decoration: BoxDecoration(
          color: ConstantColor.primaryBorderColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: ConstantColor.whiteColor,
            size: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }
}
