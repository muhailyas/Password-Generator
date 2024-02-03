import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/data/models/password_generate_model.dart';
import 'package:password_generator/features/home/presentation/bloc/save_password/save_password_bloc.dart';
import 'package:password_generator/features/home/presentation/pages/saved_passwords.dart';

import '../../data/models/save_password.dart';
import '../bloc/home/home_bloc.dart';
import '../widgets/checkbox_widget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final TextEditingController _title = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ConstantColor.primaryBorderColor,
          title: Text(
            "Password Generator",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: ConstantColor.whiteColor,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenSavedPasswords(),
                      ));
                },
                icon: const Icon(Icons.bookmark,
                    color: ConstantColor.whiteColor)),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CheckBoxWidget(checkboxItems: CheckboxItems.lowerCase),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Lower case",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: ConstantColor.whiteColor),
                  ),
                ),
                const Spacer(),
                const CheckBoxWidget(checkboxItems: CheckboxItems.uppercase),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Upper case",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: ConstantColor.whiteColor),
                  ),
                ),
                const Spacer(),
                const CheckBoxWidget(checkboxItems: CheckboxItems.numbers),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Numbers",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: ConstantColor.whiteColor),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018),
            child: Row(
              children: [
                const CheckBoxWidget(checkboxItems: CheckboxItems.specialChars),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Special characters",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: ConstantColor.whiteColor),
                  ),
                ),
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
                GestureDetector(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.updateLength(isIncrease: false));
                  },
                  child: Container(
                    height: screenWidth * 0.06,
                    width: screenWidth * 0.06,
                    decoration: BoxDecoration(
                      color: ConstantColor.primaryBorderColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: ConstantColor.whiteColor,
                        size: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.018),
                GestureDetector(
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.updateLength(isIncrease: true));
                  },
                  child: Container(
                    height: screenWidth * 0.06,
                    width: screenWidth * 0.06,
                    decoration: BoxDecoration(
                      color: ConstantColor.primaryBorderColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: ConstantColor.whiteColor,
                        size: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
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
          ),
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
                    InkWell(
                      onTap: () {
                        _password.text = bloc.state.password;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            actionsPadding: EdgeInsets.zero,
                            actions: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        ConstantColor.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color:
                                            ConstantColor.primaryBorderColor)),
                                child: Padding(
                                  padding: EdgeInsets.all(screenHeight * 0.018),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Save password",
                                        style: TextStyle(
                                          color: ConstantColor.whiteColor,
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextField(
                                        controller: _title,
                                        cursorColor:
                                            ConstantColor.primaryBorderColor,
                                        style: const TextStyle(
                                            color: ConstantColor.whiteColor),
                                        decoration: const InputDecoration(
                                          hintText: 'Title',
                                          hintStyle: TextStyle(
                                              color: ConstantColor.whiteColor),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: ConstantColor
                                                .primaryBorderColor,
                                          )),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: ConstantColor
                                                .primaryBorderColor,
                                          )),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.018),
                                      TextField(
                                        controller: _password,
                                        style: const TextStyle(
                                            color: ConstantColor.whiteColor),
                                        cursorColor:
                                            ConstantColor.primaryBorderColor,
                                        decoration: const InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              color: ConstantColor.whiteColor),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: ConstantColor
                                                .primaryBorderColor,
                                          )),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                            color: ConstantColor
                                                .primaryBorderColor,
                                          )),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.018),
                                      BlocListener<SavePasswordBloc,
                                          SavePasswordState>(
                                        listener: (context, state) {
                                          if (state is PasswordSavedSuccess) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        ConstantColor
                                                            .primaryBorderColor,
                                                    content: Text(
                                                      "Password saved",
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.04,
                                                          color: ConstantColor
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )));
                                            Navigator.pop(context);
                                          } else if (state
                                              is PasswordSavedError) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        ConstantColor
                                                            .primaryBorderColor,
                                                    content: Text(
                                                      "Error saving password",
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.04,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )));
                                          }
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            if (_password.text.isEmpty) {
                                              return;
                                            }
                                            final savePasswordModel =
                                                SavePasswordModel(
                                                    title: _title.text,
                                                    password: _password.text,
                                                    date: DateTime.now()
                                                        .toString());
                                            context
                                                .read<SavePasswordBloc>()
                                                .add(SavePasswordEvent
                                                    .savePassword(
                                                        savePassword:
                                                            savePasswordModel));
                                          },
                                          child: Container(
                                            height: screenHeight * 0.05,
                                            width: screenWidth * 0.8,
                                            decoration: BoxDecoration(
                                              color: ConstantColor
                                                  .primaryBorderColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenHeight * 0.03,
                                                    fontWeight: FontWeight.bold,
                                                    color: ConstantColor
                                                        .whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(Icons.bookmark_outline,
                          color: ConstantColor.primaryBorderColor),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.copy_rounded,
                        color: ConstantColor.primaryBorderColor),
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
}
