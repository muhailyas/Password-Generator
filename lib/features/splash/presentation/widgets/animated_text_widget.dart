import 'package:flutter/material.dart';
import 'package:password_generator/core/colors/colors.dart';

class AnimatedPasswordText extends StatelessWidget {
  AnimatedPasswordText({super.key});

  final ValueNotifier<String> _text =
      ValueNotifier(''); // Empty string to hold the animated text
  final String _passwordText = 'Password Generator';

  // Function to start the animation
  void _startAnimation() {
    const duration =
        Duration(milliseconds: 100); // Duration for each animation frame
    for (int i = 0; i < _passwordText.length; i++) {
      Future.delayed(duration * i, () {
        _text.value =
            _passwordText.substring(0, i + 1); // Update text with new letter
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _startAnimation();
    return ValueListenableBuilder(
        valueListenable: _text,
        builder: (context, password, _) {
          return Text(
            password,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: ConstantColor.primaryBorderColor,
            ),
          );
        });
  }
}
