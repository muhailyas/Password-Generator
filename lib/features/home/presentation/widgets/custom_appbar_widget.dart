import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenWidth,
    required this.text,
    this.leading,
    this.trailing,
    this.pinned = false,
  });
  final double screenWidth;
  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      leading: leading,
      backgroundColor: ConstantColor.primaryBorderColor,
      title: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.06,
          fontWeight: FontWeight.bold,
          color: ConstantColor.whiteColor,
        ),
      ),
      actions: [
        trailing == null ? const SizedBox() : trailing!,
      ],
    );
  }
}
