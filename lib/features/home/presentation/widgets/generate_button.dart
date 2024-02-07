import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/colors.dart';
import '../../data/models/password_generate_model.dart';
import '../bloc/home/home_bloc.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
    required this.screenWidth,
    required this.bloc,
    required this.screenHeight,
  });

  final double screenWidth;
  final HomeBloc bloc;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.055,
        right: screenWidth * 0.02,
        bottom: screenWidth * 0.02,
        top: screenWidth * 0.02,
      ),
      child: InkWell(
        onTap: () {
          final queries = PasswordGenerate(
              length: bloc.state.length,
              upperCase: bloc.state.uppercase,
              lowerCase: bloc.state.lowerCase,
              numbers: bloc.state.numbers,
              specialChars: bloc.state.specialChars);
          context
              .read<HomeBloc>()
              .add(HomeEvent.generatePassword(queries: queries));
        },
        child: Container(
          height: screenHeight * 0.045,
          decoration: BoxDecoration(
            color: ConstantColor.primaryBorderColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Generate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ConstantColor.whiteColor,
                  fontSize: screenWidth * 0.04,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
