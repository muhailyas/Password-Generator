import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/presentation/bloc/save_password/save_password_bloc.dart';

class ScreenSavedPasswords extends StatelessWidget {
  const ScreenSavedPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    context
        .read<SavePasswordBloc>()
        .add(const SavePasswordEvent.getAllPasswords());
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_rounded,
                color: ConstantColor.whiteColor),
          ),
          backgroundColor: ConstantColor.primaryBorderColor,
          title: Text(
            "Saved Passwords",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: ConstantColor.whiteColor,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: ConstantColor.primaryBorderColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: BlocBuilder<SavePasswordBloc, SavePasswordState>(
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
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: state.savedPasswords.length,
                          separatorBuilder: (context, index) => const Divider(
                              color: ConstantColor.primaryBorderColor),
                          itemBuilder: (context, index) {
                            final item = state.savedPasswords[index];
                            return SizedBox(
                              height: screenHeight * 0.08,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        ConstantColor.primaryBorderColor,
                                    radius: screenWidth * 0.07,
                                    child: Center(
                                      child: Text(
                                        item.title.isEmpty
                                            ? 'N'
                                            : item.title
                                                .substring(0, 1)
                                                .toUpperCase(),
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold,
                                          color: ConstantColor.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  Text(
                                    item.title.isEmpty
                                        ? 'No title'
                                        : item.title,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                      color: ConstantColor.whiteColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios_rounded,
                                      color: ConstantColor.primaryBorderColor),
                                ],
                              ),
                            );
                          },
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
        ]))
      ],
    ));
  }
}
