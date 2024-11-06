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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 75.0,
                  child: Image.asset(profileImage,fit: BoxFit.cover,color: Colors.black54,),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Name"),
                const Text("email"),
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
