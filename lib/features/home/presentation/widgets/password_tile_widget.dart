import 'package:flutter/material.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/domain/entities/save_password.dart';

class PasswordTileWidget extends StatelessWidget {
  const PasswordTileWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.item,
  });

  final double screenHeight;
  final double screenWidth;
  final SavePasswordEntity item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.08,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ConstantColor.primaryBorderColor,
            radius: screenWidth * 0.07,
            child: Center(
              child: Text(
                item.title.isEmpty
                    ? 'N'
                    : item.title.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: ConstantColor.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Text(
            item.title.isEmpty ? 'No title' : item.title,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
              color: ConstantColor.whiteColor,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded,
              color: ConstantColor.primaryBorderColor),
        ],
      ),
    );
  }
}
