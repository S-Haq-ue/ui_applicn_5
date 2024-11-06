import 'package:flutter/material.dart';
import 'package:ui_applicn_5/const_file.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
            child:  const Column(
              children: [
                SizedBox(height: 50,),
                CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 75.0,
                ),
                SizedBox(height: 20,),
                Text("Name"),
                Text("email"),
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
