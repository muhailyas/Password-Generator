import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/colors.dart';
import '../../data/models/save_password.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/save_password/save_password_bloc.dart';

class SaveIconWidget extends StatelessWidget {
  const SaveIconWidget({
    super.key,
    required TextEditingController password,
    required this.bloc,
    required this.screenHeight,
    required this.screenWidth,
    required TextEditingController title,
  })  : _password = password,
        _title = title;

  final TextEditingController _password;
  final HomeBloc bloc;
  final double screenHeight;
  final double screenWidth;
  final TextEditingController _title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _password.text = bloc.state.password;
        showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            actionsPadding: EdgeInsets.zero,
            actions: [
              Container(
                decoration: BoxDecoration(
                    color: ConstantColor.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ConstantColor.primaryBorderColor)),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.018),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        cursorColor: ConstantColor.primaryBorderColor,
                        style: const TextStyle(color: ConstantColor.whiteColor),
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(color: ConstantColor.whiteColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ConstantColor.primaryBorderColor,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ConstantColor.primaryBorderColor,
                          )),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.018),
                      TextField(
                        controller: _password,
                        style: const TextStyle(color: ConstantColor.whiteColor),
                        cursorColor: ConstantColor.primaryBorderColor,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: ConstantColor.whiteColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ConstantColor.primaryBorderColor,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: ConstantColor.primaryBorderColor,
                          )),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.018),
                      BlocListener<SavePasswordBloc, SavePasswordState>(
                        listener: (context, state) {
                          if (state is PasswordSavedSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                    ConstantColor.primaryBorderColor,
                                content: Text(
                                  "Password saved",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: ConstantColor.whiteColor,
                                      fontWeight: FontWeight.w500),
                                )));
                            Navigator.pop(context);
                          } else if (state is PasswordSavedError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                    ConstantColor.primaryBorderColor,
                                content: Text(
                                  "Error saving password",
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                )));
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            if (_password.text.isEmpty) {
                              return;
                            }
                            final savePasswordModel = SavePasswordModel(
                                title: _title.text,
                                password: _password.text,
                                date: DateTime.now().toString());
                            context.read<SavePasswordBloc>().add(
                                SavePasswordEvent.savePassword(
                                    savePassword: savePasswordModel));
                          },
                          child: Container(
                            height: screenHeight * 0.05,
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              color: ConstantColor.primaryBorderColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: screenHeight * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: ConstantColor.whiteColor,
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
    );
  }
}
