import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/screens/home_page/home_screen.dart';
import 'package:ui_applicn_5/screens/login_screen/provider_login_screen.dart';
import 'package:ui_applicn_5/screens/registration_screen/registration_screen.dart';
import 'package:ui_applicn_5/widgets/custom_button.dart';
import 'package:ui_applicn_5/widgets/custome_text_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenProvider>(
      builder: (context, loginPageProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: loginPageProvider.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingValue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextField(
                          hintText: 'email Id',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: backgroundColor,
                          ),
                          controller: loginPageProvider.emailController,
                          focusNode: loginPageProvider.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'Please enter email id';
                            } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
                              return 'Please enter a valid email id';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          maxLength: 20,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            onPressed: () => loginPageProvider.changepasswodVisibility(),
                            icon: Icon(
                              loginPageProvider.passwordVisibility ? Icons.visibility : Icons.visibility_off,
                              color: backgroundColor,
                            ),
                          ),
                          controller: loginPageProvider.passwordController,
                          focusNode: loginPageProvider.passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          obscureText: loginPageProvider.passwordVisibility,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'Please enter password';
                            } else if (password.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onFieldSubmitted: (mobile) async =>
                              loginClick(context: context, loginFuction: loginPageProvider.login),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          isLoading: loginPageProvider.isLoading,
                          onPressed: () => loginClick(context: context, loginFuction: loginPageProvider.login),
                          child: const Text(
                            'Login',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegistrationScreen.classId);
                          },
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.center,
                          ),
                          child: const Text(
                            'Register',
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(color: secondaryColor),
                          ),
                        ),
                        const Text(
                          "Or",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(color: secondaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    loginClick(context: context, loginFuction: loginPageProvider.googleSignIn),
                                icon: Brand(Brands.google)),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(onPressed: () {}, icon: Brand(Brands.twitterx_2)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void loginClick({required BuildContext context, required Future<String?> Function() loginFuction}) async {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();
    try {
      String? loginStatus = await loginFuction();
      if (loginStatus == 'Auth Success') {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(HomeScreen.classId);
      } else if (loginStatus == null) {
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              loginStatus,
              textScaler: const TextScaler.linear(1),
            ),
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      debugPrint(e.toString());
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong.',
            textScaler: TextScaler.linear(1),
          ),
        ),
      );
    }
  }
}
