import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/services/user_model.dart';

class CustomDrawer extends StatelessWidget {
  final UserDetails? userDetails;
  const CustomDrawer({super.key, this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 75.0,
                  child: Image.asset(
                    profileImage,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  userDetails!.name,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  userDetails!.email,
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
