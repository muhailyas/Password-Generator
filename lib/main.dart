import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/splash/presentation/bloc/splash/splash_bloc.dart';
import 'package:password_generator/features/splash/presentation/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Password generator',
        theme: ThemeData(
          scaffoldBackgroundColor: ConstantColor.scaffoldBackgroundColor,
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
