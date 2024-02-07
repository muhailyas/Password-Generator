import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors/colors.dart';
import '../bloc/save_password/save_password_bloc.dart';
import 'password_tile_widget.dart';

class PasswordsListWidget extends StatelessWidget {
  const PasswordsListWidget(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.state});

  final double screenHeight;
  final double screenWidth;
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: state.savedPasswords.length,
      separatorBuilder: (context, index) =>
          const Divider(color: ConstantColor.primaryBorderColor),
      itemBuilder: (context, index) {
        final item = state.savedPasswords[index];
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                actionsPadding: EdgeInsets.zero,
                actions: [
                  Container(
                    decoration: BoxDecoration(
                        color: ConstantColor.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ConstantColor.primaryBorderColor)),
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
                          SizedBox(height: screenHeight * 0.018),
                          Text(item.title,
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                  color: ConstantColor.whiteColor)),
                          SizedBox(height: screenHeight * 0.01),
                          const Divider(
                            color: ConstantColor.primaryBorderColor,
                          ),
                          SizedBox(height: screenHeight * 0.018),
                          SizedBox(height: screenHeight * 0.018),
                          Text(item.password,
                              style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w500,
                                  color: ConstantColor.whiteColor)),
                          SizedBox(height: screenHeight * 0.01),
                          const Divider(
                            color: ConstantColor.primaryBorderColor,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll(
                                        Size(screenWidth, screenHeight * 0.04)),
                                    shape: MaterialStatePropertyAll(
                                        ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    foregroundColor:
                                        const MaterialStatePropertyAll(
                                            ConstantColor.whiteColor),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            ConstantColor.primaryBorderColor)),
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  context.read<SavePasswordBloc>().add(
                                      SavePasswordEvent.deletePassword(
                                          id: item.id!));
                                },
                                label: const Text("Delete")),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: PasswordTileWidget(
              screenHeight: screenHeight, screenWidth: screenWidth, item: item),
        );
      },
    );
  }
}
