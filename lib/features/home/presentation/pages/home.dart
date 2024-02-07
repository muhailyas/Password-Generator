import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/core/utils/screen_manger.dart';
import 'package:password_generator/features/home/presentation/pages/saved_passwords.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/checkbox_widget.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/generate_button.dart';
import '../widgets/length_adjust_widget.dart';
import '../widgets/save_icon_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenManager.screenWidth;
    final screenHeight = ScreenManager.screenHeight;
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        homeAppBar(screenWidth, context),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                checkboxWithText(
                    screenWidth: screenWidth,
                    text: 'Lower case',
                    value: CheckboxItems.lowerCase),
                const Spacer(),
                checkboxWithText(
                    screenWidth: screenWidth,
                    text: "Upper case",
                    value: CheckboxItems.uppercase),
                const Spacer(),
                checkboxWithText(
                    screenWidth: screenWidth,
                    text: "Numbers",
                    value: CheckboxItems.numbers),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
            child: Row(
              children: [
                checkboxWithText(
                    screenWidth: screenWidth,
                    text: "Special characters",
                    value: CheckboxItems.specialChars),
                const Spacer(),
                Text(
                  "Length",
                  style: TextStyle(
                    color: ConstantColor.whiteColor,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(width: screenWidth * 0.018),
                Column(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Text(
                          state.length.toString(),
                          style: TextStyle(
                            color: ConstantColor.whiteColor,
                            fontSize: screenWidth * 0.04,
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 2,
                      width: screenWidth * 0.06,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(width: screenWidth * 0.018),
                LengthAdjustWidget(
                  screenWidth: screenWidth,
                  iconData: Icons.remove,
                  ontap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.updateLength(isIncrease: false));
                  },
                ),
                SizedBox(width: screenWidth * 0.018),
                LengthAdjustWidget(
                  screenWidth: screenWidth,
                  iconData: Icons.add,
                  ontap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.updateLength(isIncrease: true));
                  },
                ),
              ],
            ),
          ),
          GenerateButton(
              screenWidth: screenWidth, bloc: bloc, screenHeight: screenHeight),
          SizedBox(height: screenWidth * 0.05),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    const Spacer(),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        bloc.password.text = state.password;
                        return SizedBox(
                          width: screenWidth * 0.74,
                          child: Center(
                            child: Text(
                              state.password.isEmpty ? '' : state.password,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                color: ConstantColor.whiteColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    SaveIconWidget(
                        password: bloc.password,
                        bloc: bloc,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        title: bloc.title),
                    SizedBox(width: screenWidth * 0.03),
                    InkWell(
                      onTap: () async {
                        if (bloc.password.text.isEmpty) {
                          return;
                        }
                        Clipboard.setData(
                                ClipboardData(text: bloc.password.text))
                            .then(
                          (value) {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor:
                                    ConstantColor.primaryBorderColor,
                                content: Text('Text Copied'),
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.copy_rounded,
                          color: ConstantColor.primaryBorderColor),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: screenWidth * 0.9,
                color: ConstantColor.primaryBorderColor,
              )
            ],
          )
        ]))
      ],
    ));
  }

  Widget checkboxWithText(
      {required double screenWidth,
      required CheckboxItems value,
      required String text}) {
    return Row(
      children: [
        CheckBoxWidget(checkboxItems: value),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text,
            style: TextStyle(
                fontSize: screenWidth * 0.04, color: ConstantColor.whiteColor),
          ),
        ),
      ],
    );
  }

  Widget homeAppBar(double screenWidth, BuildContext context) {
    return CustomAppBar(
      screenWidth: screenWidth,
      text: "Password Generator",
      trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenSavedPasswords(),
                ));
          },
          icon: const Icon(Icons.bookmark, color: ConstantColor.whiteColor)),
    );
  }
}
