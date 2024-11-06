import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/screens/home_page/provider_home_screen.dart';
import 'package:ui_applicn_5/screens/home_page/components/body.dart';
import 'package:ui_applicn_5/services/user_model.dart';

class HomeScreen extends StatelessWidget {
  final UserDetails? userDetails;
  static const classId = '/HomeScreen';
  const HomeScreen({super.key, this.userDetails});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(userDetails),
      child: const Body(),
    );
  }
}
