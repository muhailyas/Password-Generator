import 'package:flutter/material.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/presentation/bloc/save_password/save_password_bloc.dart';
import 'package:password_generator/features/home/presentation/pages/home.dart';
import 'package:password_generator/features/splash/presentation/bloc/splash/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/animated_text_widget.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SavePasswordBloc>()
          .add(const SavePasswordEvent.initializeSavedDb());
      context.read<SplashBloc>().add(const SplashEvent.started());
    });
    return Scaffold(
      backgroundColor: ConstantColor.blackColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Navigate) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ScreenHome()));
          }
        },
        child: const Center(
          child: Center(child: AnimatedPasswordText()),
        ),
      ),
    );
  }
}
