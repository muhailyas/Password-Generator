import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/core/constats/constants.dart';
import 'package:password_generator/features/home/presentation/bloc/save_password/save_password_bloc.dart';
import 'package:password_generator/features/home/presentation/widgets/custom_appbar_widget.dart';
import '../../../../core/utils/screen_manger.dart';
import '../widgets/password_list_widget.dart';

class ScreenSavedPasswords extends StatelessWidget {
  const ScreenSavedPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<SavePasswordBloc>()
        .add(const SavePasswordEvent.getAllPasswords());
    return Scaffold(
      body: _buildBody(context),
    );
  }

  CustomScrollView _buildBody(BuildContext context) {
    final screenWidth = ScreenManager.screenWidth;
    final screenHeight = ScreenManager.screenHeight;
    return CustomScrollView(
      slivers: [
        CustomAppBar(
          screenWidth: screenWidth,
          text: "Saved Passwords",
          pinned: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded,
                color: ConstantColor.whiteColor),
          ),
        ),
        _buildPasswordList(screenWidth, screenHeight)
      ],
    );
  }

  SliverList _buildPasswordList(double screenWidth, double screenHeight) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: ConstantColor.primaryBorderColor),
              borderRadius: Constants.radius15,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: BlocConsumer<SavePasswordBloc, SavePasswordState>(
                listener: (context, state) {
                  if (state is DeleteSuccess) {
                    Navigator.pop(context);
                    context
                        .read<SavePasswordBloc>()
                        .add(const SavePasswordEvent.getAllPasswords());
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text("Password Deleted"),
                        backgroundColor: ConstantColor.primaryBorderColor,
                      ));
                  }
                },
                builder: (context, state) {
                  if (state is PasswordFetchSuccess) {
                    if (state.savedPasswords.isEmpty) {
                      return Center(
                          child: Text(
                        "No Passwords Saved Yet?",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: ConstantColor.whiteColor,
                            fontWeight: FontWeight.bold),
                      ));
                    }
                    return PasswordsListWidget(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      state: state,
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: ConstantColor.primaryBorderColor,
                    ));
                  }
                },
              ),
            )),
      ),
    ]));
  }
}
