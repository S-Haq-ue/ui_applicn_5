import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/screens/login_screen/components/body.dart';
import 'package:ui_applicn_5/screens/login_screen/provider_login_screen.dart';

class LoginScreen extends StatelessWidget {
  static const classId = '/LoginPage';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (context) => LoginScreenProvider(),
            child: const Body(),
          );
  }
}
