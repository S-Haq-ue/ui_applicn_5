import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/Provider/common_provider.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/screens/home_page/home_screen.dart';
import 'package:ui_applicn_5/screens/login_screen/login_screen.dart';
import 'package:ui_applicn_5/screens/product_details/product_details_screen.dart';
import 'package:ui_applicn_5/screens/registration_screen/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommonProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          canvasColor: secondaryColor,
          hintColor: hintColor,
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        routes: {
          RegistrationScreen.classId: (BuildContext context) => const RegistrationScreen(),
          LoginScreen.classId: (BuildContext context) => const LoginScreen(),
          HomeScreen.classId: (BuildContext context) => const HomeScreen(),
          ProductDetails.classId: (BuildContext context) => const ProductDetails(),
        },
      ),
    );
  }
}
