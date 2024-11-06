import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/screens/home_page/provider_home_screen.dart';
import 'package:ui_applicn_5/screens/home_page/components/body.dart';

class HomeScreen extends StatelessWidget {
  static const classId = '/HomeScreen';
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const Body(),
    );
  }
}
