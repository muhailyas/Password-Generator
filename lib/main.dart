import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/data/data_sources/local/save_password_db.dart';
import 'package:password_generator/features/home/data/data_sources/password_generate_service.dart';
import 'package:password_generator/features/home/data/repository/password_generator_impl.dart';
import 'package:password_generator/features/home/data/repository/save_password_repo_impl.dart';
import 'package:password_generator/features/home/domain/use_cases/generate_pass_usecese/generate_pass_usecese.dart';
import 'package:password_generator/features/home/domain/use_cases/get_all_passwords_usecase/get_all_passwords_usecase.dart';
import 'package:password_generator/features/home/domain/use_cases/initialize_db_usecase/initialize_db_usecase.dart';
import 'package:password_generator/features/home/domain/use_cases/save_password_use_case/save_password_use_case.dart';
import 'package:password_generator/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:password_generator/features/home/presentation/bloc/save_password/save_password_bloc.dart';
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
        BlocProvider(
            create: (context) => HomeBloc(
                  GeneratePasswordUseCase(PasswordGenerateRepositoryImpl(
                      PasswordGenerateService())),
                )),
        BlocProvider(
          create: (context) => SavePasswordBloc(
              GetAllSavedPasswordsUseCase(
                  SavePasswordRepositoryImpl(SavePasswordService())),
              SavePasswordUseCase(
                  SavePasswordRepositoryImpl(SavePasswordService())),
              InitilizeDbUseCase(
                  SavePasswordRepositoryImpl(SavePasswordService()))),
        )
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
