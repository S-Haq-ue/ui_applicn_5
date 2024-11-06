import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/screens/registration_screen/components/body.dart';
import 'package:ui_applicn_5/screens/registration_screen/provider_registration_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const classId = '/RegisterScreen';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (context) => RegistrationScreenProvider(),
            child: const Body(),
          );
  }
}
