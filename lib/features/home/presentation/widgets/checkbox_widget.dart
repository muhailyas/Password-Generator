import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/presentation/bloc/home/home_bloc.dart';

enum CheckboxItems { lowerCase, uppercase, numbers, specialChars }

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key, required this.checkboxItems});
  final CheckboxItems checkboxItems;

  bool findItem(HomeState state) {
    switch (checkboxItems) {
      case CheckboxItems.lowerCase:
        return state.lowerCase;
      case CheckboxItems.numbers:
        return state.numbers;
      case CheckboxItems.uppercase:
        return state.uppercase;
      case CheckboxItems.specialChars:
        return state.specialChars;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Checkbox(
            activeColor: ConstantColor.primaryBorderColor,
            side: const BorderSide(
              color: ConstantColor.whiteColor,
            ),
            value: findItem(state),
            onChanged: (value) {
              if (checkboxItems == CheckboxItems.lowerCase) {
                context.read<HomeBloc>().add(const HomeEvent.toggleLowerCase());
              } else if (checkboxItems == CheckboxItems.uppercase) {
                context.read<HomeBloc>().add(const HomeEvent.toggleUpperCase());
              } else if (checkboxItems == CheckboxItems.numbers) {
                context.read<HomeBloc>().add(const HomeEvent.toggleNumbers());
              } else if (checkboxItems == CheckboxItems.specialChars) {
                context
                    .read<HomeBloc>()
                    .add(const HomeEvent.toggleSpecialChars());
              }
            });
      },
    );
  }
}
