import 'package:flutter/material.dart';

class AnimatedPasswordText extends StatefulWidget {
  const AnimatedPasswordText({Key? key}) : super(key: key);

  @override
  AnimatedPasswordTextState createState() => AnimatedPasswordTextState();
}

class AnimatedPasswordTextState extends State<AnimatedPasswordText> {
  late String _text = ''; // Empty string to hold the animated text
  final String _passwordText = 'Password Generator'; // Original text

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  // Function to start the animation
  void _startAnimation() {
    const duration =
        Duration(milliseconds: 100); // Duration for each animation frame
    for (int i = 0; i < _passwordText.length; i++) {
      Future.delayed(duration * i, () {
        setState(() {
          _text =
              _passwordText.substring(0, i + 1); // Update text with new letter
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
