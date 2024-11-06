import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryColor,
      shadowColor: primaryColor,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: paddingValue),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Bootstrap.heart_fill),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: paddingValue),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    height: 200,
                    width: 0,
                    decoration: BoxDecoration(
                      color: primaryColor,borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: paddingValue),
                          child: Text(
                            "Are you sure to quit?",
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: paddingValue - 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                isLoading: false,
                                onPressed: () async {},
                                child: const Text(
                                  "YES",
                                  textScaler: TextScaler.linear(1),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              CustomButton(
                                onPressed: () => Navigator.of(context).pop(),
                                isLoading: false,
                                child: const Text(
                                  "NO",
                                  textScaler: TextScaler.linear(1),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
