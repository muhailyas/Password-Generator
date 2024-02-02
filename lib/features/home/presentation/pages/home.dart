import 'package:flutter/material.dart';
import 'package:password_generator/core/colors/colors.dart';
import 'package:password_generator/features/home/presentation/pages/saved_passwords.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                const CheckBoxWidget(),
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
                const CheckBoxWidget(),
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
                const CheckBoxWidget(),
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
                const CheckBoxWidget(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Special characters",
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: ConstantColor.whiteColor),
                  ),
                ),
                // SizedBox(width: screenWidth * 0.03),
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
                    Text(
                      "10",
                      style: TextStyle(
                        color: ConstantColor.whiteColor,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: screenWidth * 0.06,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(width: screenWidth * 0.018),
                Container(
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
                SizedBox(width: screenWidth * 0.018),
                Container(
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
          SizedBox(height: screenWidth * 0.05),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    const Spacer(),
                    const Text(
                      "wohonsdjhfkhesf",
                      style: TextStyle(
                        fontSize: 20,
                        color: ConstantColor.whiteColor,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
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
                                      const TextField(
                                        cursorColor:
                                            ConstantColor.primaryBorderColor,
                                        decoration: InputDecoration(
                                          hintText: 'title',
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
                                      const TextField(
                                        cursorColor:
                                            ConstantColor.primaryBorderColor,
                                        decoration: InputDecoration(
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
                                      Container(
                                        height: screenHeight * 0.05,
                                        width: screenWidth * 0.8,
                                        decoration: BoxDecoration(
                                          color:
                                              ConstantColor.primaryBorderColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
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

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: ConstantColor.primaryBorderColor,
        side: const BorderSide(
          color: ConstantColor.whiteColor,
        ),
        value: isSelected,
        onChanged: (value) {
          setState(() {
            isSelected = value ?? false;
          });
        });
  }
}
